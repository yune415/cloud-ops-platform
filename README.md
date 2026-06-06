# 云原生运维平台

## 项目概述
独立完成的企业级全链路运维平台，覆盖云基础设施、容器化部署、监控告警、自动化运维、备份容灾和安全加固。

## 技术栈
| 类别 | 技术 |
|---|---|
| 云平台 | 阿里云 ECS / VPC / 安全组 / OSS |
| 容器化 | Docker + Docker Compose |
| Web服务 | Nginx |
| 数据库 | MySQL |
| 监控告警 | Prometheus + Grafana + Alertmanager + 钉钉 |
| 自动化 | Ansible |
| CI/CD | GitHub Actions + OIDC + Gitleaks |

## 项目成果
- ✅ VPC/安全组/ECS 云环境搭建，实现网络隔离与最小权限
- ✅ Docker 部署 Nginx，端口映射与目录挂载
- ✅ Prometheus + Grafana 监控，钉钉告警通道已打通
- ✅ Ansible Playbook 批量检查服务状态
- ✅ MySQL 全量备份 + OSS 跨区域存储，RTO < 10分钟
- ✅ 安全加固 10 项达标（UFW + 安全组 + IP白名单）

## 目录结构
cloud-ops-platform/
├── README.md
├── scripts/ # 运维脚本
│ └── mysql_backup_enhanced.sh
├── docker/
│ └── docker-compose.yml # 容器编排
├── ansible/
│ └── check-services.yml # 服务巡检
├── monitoring/
│ └── prometheus/
│ └── prometheus.yml # 监控配置
└── docs/ # SOP文档
├── compliance/ # 合规分析
└── security/ # 应急响应

## 联系方式
- GitHub: [yune415](https://github.com/yune415)
- 邮箱: 3232175469@qq.com
