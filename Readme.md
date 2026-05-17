# 🚀 Basic CI/CD Deployment Pipeline with Terraform, AWS, Docker & GitHub Actions

## 📌 Project Overview
This project demonstrates a complete DevOps CI/CD pipeline that automates infrastructure provisioning and application deployment on AWS using Terraform, Docker, Amazon ECR, EC2, IAM roles, and GitHub Actions.

The pipeline provisions cloud infrastructure, builds and pushes Docker images to ECR, and deploys containerized applications automatically to an EC2 instance whenever code is pushed to the `main` branch.

---

## ✨ Features
- **Automated infrastructure provisioning using Terraform**
- **AWS EC2 instance deployment**
- **Secure SSH key pair management**
- **IAM roles for secure ECR access**
- **Dockerized Node.js application**
- **Amazon ECR repository creation and image storage**
- **GitHub Actions CI/CD workflow automation**
- **Automated Docker image deployment to EC2**
- **Remote Terraform state management using S3 backend**

---

## 🛠️ Tech Stack
- **Terraform**
- **AWS EC2**
- **AWS ECR**
- **AWS IAM**
- **AWS S3**
- **GitHub Actions**
- **Docker**
- **Node.js**
- **Linux (Amazon Linux)**

---

## 🏗️ Architecture Workflow
```txt
GitHub Push
    ↓
GitHub Actions Trigger
    ↓
Terraform Init → Plan → Apply
    ↓
AWS Infrastructure Provisioned:
   - EC2
   - Security Group
   - IAM Role
   - Key Pair
   - ECR Repository
    ↓
Docker Build
    ↓
Push Docker Image to Amazon ECR
    ↓
SSH into EC2
    ↓
Pull Latest Docker Image
    ↓
Run Container on Port 80


📂 Repository Structure
project-root/
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── nodeapp/
│   ├── Dockerfile
│   ├── package.json
│   └── index.js
│
└── README.md

⚙️ Setup Instructions
1️⃣ AWS Setup
Create S3 bucket for Terraform backend
Create IAM user with programmatic access
Generate AWS Access Key ID & Secret Access Key
Generate SSH key pair

2️⃣ GitHub Secrets Required

3️⃣ Terraform Deployment

Terraform provisions:

EC2 instance
Security Group
IAM Instance Profile
Key Pair
ECR Repository

4️⃣ GitHub Actions Workflow

On every push to main:

Initializes Terraform backend
Plans infrastructure changes
Applies infrastructure
Builds Docker image
Pushes image to ECR
Connects to EC2
Deploys latest container
🎯 Key Learning Outcomes
Infrastructure as Code (IaC)
Terraform backend management
AWS security best practices
IAM role-based authentication
Docker container deployment
GitHub Actions automation
End-to-end CI/CD pipeline implementation
