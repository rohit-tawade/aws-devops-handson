

### 📄 `GUIDE.md` (Project Summary: Tasks 1 to 9)

````markdown
# 🚀 Crecita DevOps Cloud Project – Tasks 1 to 9

This repository documents the successful completion of **Tasks 1 to 9** from the `aws-devops-handson` project, focused on DevOps, Terraform, Ansible, Docker, Kubernetes, and Monitoring.

---

## ✅ Completed Task List

### 🔹 Task 1: Run React App Locally
- React app cloned and set up.
- Verified on `localhost:3000`.

---

### 🔹 Task 2: Provision EC2 Instance Using Terraform
- Terraform scripts created:
  - `main.tf`, `variables.tf`, `security_group.tf`, `outputs.tf`
- EC2 instance provisioned on AWS (Amazon Linux).
- Security group allowed ports 22 (SSH) and 3000 (React).
- Terraform triggered using GitHub Actions.

---

### 🔹 Task 3: Install & Run React App using Ansible
- Ansible playbook created to:
  - Install Node.js
  - Install dependencies
  - Start React app with `nohup`
- App deployed on EC2 instance via Ansible.

---

### 🔹 Task 4: Automate Deployment Using GitHub Actions + Ansible
- CI/CD pipeline built using `.github/workflows/main-deploy.yml`
- On code push:
  - Terraform deploys EC2
  - Ansible installs and runs React app

---

### 🔹 Task 5: Docker + ECR + ECS Deployment
- Dockerized the React app.
- Docker image pushed to **AWS ECR**.
- ECS cluster and service created using **Terraform**.
- Deployment automated via **GitHub Actions**.

---

### 🔹 Task 6: Kubernetes Deployment
- Minikube used for local Kubernetes cluster.
- Wrote manifests for:
  - `Deployment` and `Service`
- React app deployed and accessed using:
  ```bash
  kubectl port-forward svc/react-app 3000:80
````

---

### 🔹 Task 7: Monitor Pod CPU/Memory using Prometheus + Grafana

* Installed Prometheus & Grafana via Helm:

  ```bash
  helm install monitoring prometheus-community/kube-prometheus-stack
  ```
* Verified metrics in Grafana:

  * Dashboards for Kubernetes CPU, memory, pods, etc.

---

### 🔹 Task 8: Deploy a Container Using a Kubernetes Secret

* Secret `welcome-secret` created with:

  ```bash
  WELCOME_MSG="Welcome to Crecita"
  ```
* Deployed container (`hashicorp/http-echo`) using the secret as an environment variable.
* Verified response via:

  ```bash
  curl http://localhost:8080
  ```

---

### 🔹 Task 9: Auto-Refresh Secret Without Pod Restart

* Secret updated with new message:

  ```bash
  message="🚀 Welcome to Crecita — Level Up DevOps!"
  ```
* Mounted as a file inside the container.
* Used `python http.server` to serve secret file.
* Container copied file every 30 seconds.
* Verified that updated secret reflected automatically without restarting the pod.

---

## 📂 Folder Structure

```
crecita-devops-project/
├── terraform/               # EC2, ECS IaC
├── ansible/                 # Playbooks for app setup
├── docker/                  # Dockerfiles
├── k8s/                     # Kubernetes YAMLs
├── monitoring/              # Prometheus + Grafana setup
├── .github/workflows/       # GitHub Actions
├── docs/                    # Task-wise .md files
└── screenshots/             # Visual Proofs
```

---

## 📌 Conclusion

All tasks (1 to 9) were completed successfully with full automation using DevOps best practices. This project demonstrates:

* Infrastructure as Code (Terraform)
* Configuration Management (Ansible)
* Containerization (Docker)
* Orchestration (Kubernetes)
* Monitoring (Prometheus + Grafana)
* CI/CD Pipelines (GitHub Actions)

---

## 🙌 Author

**Rohit Santram Tawade**
DevOps Engineer in Training | Passionate Learner
