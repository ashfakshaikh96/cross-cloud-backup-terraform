# Cross-Cloud Backup using Terraform (AWS S3 → Azure Blob Storage)

## Project Overview
This project implements a **cross-cloud backup solution** where data from an
**existing AWS S3 bucket** is backed up to **Azure Blob Storage** using
**Terraform**.

The main objective of this task is to demonstrate:
- Terraform structure and best practices
- Multi-cloud (AWS + Azure) understanding
- Secure and production-oriented design

Actual infrastructure provisioning is **not mandatory**, as the task focuses on
design and implementation approach rather than live execution.

---

## Architecture Overview

**Source Cloud:** AWS  
**Destination Cloud:** Azure  

### Backup Flow
1. Data is stored in an existing **AWS S3 bucket**
2. An **AWS EC2 instance** acts as a backup worker
3. EC2 accesses S3 using an **IAM Role (least privilege)**
4. Backup runs every **4 hours** using **AWS EventBridge**
5. Data is uploaded to **Azure Blob Storage** (private container)

AWS S3 → EC2 (IAM Role) → Azure Blob Storage
---

## Project Structure

cross-cloud-backup/
│
├── aws/
│ ├── provider.tf
│ ├── variables.tf
│ ├── iam.tf
│ ├── ec2.tf
│ ├── eventbridge.tf
│ ├── outputs.tf
│ └── terraform.tfvars
│
├── azure/
│ ├── provider.tf
│ ├── variables.tf
│ ├── main.tf
│ ├── storage.tf
│ ├── outputs.tf
│ └── terraform.tfvars
│
├── scripts/
│ └── backup.sh
│
└── README.md

yaml
Copy code

---

## AWS Components
- Existing **S3 Bucket** (data source)
- **IAM Role & Policy** (read-only access to S3)
- **EC2 Instance** (backup worker)
- **EventBridge Rule** (runs every 4 hours)

---

## Azure Components
- **Resource Group**
- **Storage Account**
- **Private Blob Container**

---

## Backup Mechanism
The backup script performs:
- `aws s3 sync` to copy data from S3
- Azure Blob upload using Azure CLI

This ensures:
- Incremental backups
- No duplicate uploads
- Efficient data transfer

---

## Security Considerations
- No hardcoded credentials in Terraform
- AWS access via IAM Role
- Azure authentication via Azure CLI
- Least-privilege IAM policy
- Private Azure Blob container
- Clean separation of infrastructure and scripts

---

## Terraform Execution Strategy

### AWS
- `terraform init`
- `terraform plan` executed successfully

### Azure
- `terraform init`
- `terraform plan` requires Azure CLI login

> **Note:**  
> `terraform apply` was intentionally not executed to avoid unnecessary cloud
> costs. The task focuses on design and Terraform implementation.

---

## Assumptions
- An existing AWS S3 bucket is available
- Terraform execution environment may not always have full cloud access
- Design and best practices are prioritized over live deployment

---

## Key Highlights
- Multi-cloud architecture (AWS + Azure)
- Modular Terraform structure
- Secure authentication approach
- Industry-standard DevOps practices
- Production-ready design mindset
