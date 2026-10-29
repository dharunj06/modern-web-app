# NIST Cybersecurity Framework Implementation Matrix

## Project: modern-web-app

| Function | Category | Implemented Controls | Status |
| :--- | :--- | :--- | :--- |
| **IDENTIFY (ID)** | Asset Management (ID.AM) | Automated inventory via Terraform and Kubernetes tags | ✅ Enforced |
| **PROTECT (PR)** | Access Control (PR.AC) | Least privilege RBAC, Non-root containers, NetworkPolicies | ✅ Enforced |
| **DETECT (DE)** | Anomalies and Events (DE.AE) | Prometheus & Audit logs threshold alerts | ✅ Active |
| **RESPOND (RS)** | Response Planning (RS.RP) | Automated pod restarts, circuit breaking | ✅ Verified |
| **RECOVER (RC)** | Recovery Planning (RC.RP) | Multi-AZ replication, persistent volume snapshots | ✅ Configured |
