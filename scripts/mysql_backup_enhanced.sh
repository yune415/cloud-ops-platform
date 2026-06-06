#!/bin/bash
BACKUP_DIR="/opt/cloud-ops/backup"
DATE=$(date +%Y%m%d_%H%M%S)
OSS_BUCKET="cloudops-backup-2026"
OSS_ENDPOINT="oss-cn-wulanchabu.aliyuncs.com"
ROLE_NAME="oss-backup-role"

# 1. 获取 STS 临时凭证
CREDS=$(curl -s http://100.100.100.200/latest/meta-data/ram/security-credentials/$ROLE_NAME)

# 调试：检查凭证是否获取成功
if [ $? -ne 0 ] || [ -z "$CREDS" ]; then
    echo "ERROR: Failed to get STS credentials" >> /var/log/mysql_backup.log
    exit 1
fi

AK=$(echo $CREDS | jq -r '.AccessKeyId')
SK=$(echo $CREDS | jq -r '.AccessKeySecret')
TOKEN=$(echo $CREDS | jq -r '.SecurityToken')

# 调试：检查解析是否成功
if [ "$AK" == "null" ] || [ -z "$AK" ]; then
    echo "ERROR: Failed to parse STS credentials" >> /var/log/mysql_backup.log
    exit 1
fi

mkdir -p $BACKUP_DIR/$DATE

# 2. MySQL 全量备份
mysqldump -uroot -pCloudOps2026! \
  --all-databases \
  --single-transaction \
  > $BACKUP_DIR/$DATE/full_backup.sql

gzip $BACKUP_DIR/$DATE/full_backup.sql

# 3. 使用临时凭证上传到 OSS（关键修复）
ossutil cp $BACKUP_DIR/$DATE/full_backup.sql.gz \
  oss://$OSS_BUCKET/backups/mysql/$DATE/ \
  --access-key-id "$AK" \
  --access-key-secret "$SK" \
  --sts-token "$TOKEN" \
  --endpoint "$OSS_ENDPOINT"

# 检查上传结果
if [ $? -eq 0 ]; then
    echo "$DATE: Backup completed and synced to OSS successfully" >> /var/log/mysql_backup.log
else
    echo "$DATE: ERROR - Backup upload failed" >> /var/log/mysql_backup.log
fi

# 4. 清理本地过期备份（保留7天）
find $BACKUP_DIR -type d -mtime +7 -exec rm -rf {} \;
