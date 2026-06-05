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

## 快速访问（示例环境）
| 服务 | 地址 |
|---|---|
| Nginx | http://8.147.70.48 |
| Prometheus | http://8.147.70.48:9090 |
| Grafana | http://8.147.70.48:3000 |

## 项目结构
cloud-ops-platform/
├── README.md
├── docs/ # 架构图、SOP文档
├── scripts/ # 备份脚本、健康检查
├── ansible/ # Playbook
├── docker/ # docker-compose.yml
└── monitoring/ # Prometheus配置
