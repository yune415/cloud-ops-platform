# 云原生运维平台

## 项目概述
独立完成的企业级全链路运维平台，覆盖云基础设施、容器化部署、监控告警、自动化运维、备份容灾和安全加固。

## 技术栈
- 阿里云 ECS / VPC / 安全组 / OSS
- Docker + Docker Compose
- Nginx + MySQL
- Prometheus + Grafana + Alertmanager + 钉钉
- Ansible
- GitHub Actions + OIDC + Gitleaks

## 项目结构
cloud-ops-platform/
├── README.md
├── scripts/ # 备份脚本
├── docker/ # docker-compose.yml
├── ansible/ # Ansible Playbook
├── monitoring/ # Prometheus配置
└── docs/ # SOP文档
