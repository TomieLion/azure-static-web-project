# Automated Azure Static Website Deployment with GitHub Actions

A professional Cloud Engineering project demonstrating Infrastructure as Code (IaC), CI/CD automation, and cloud-native hosting using Azure and GitHub Actions. This project automates the provisioning of Azure resources and the deployment of a modern Tailwind CSS landing page.

## 🚀 Project Overview

The goal of this project was to move away from manual deployments and move toward a fully automated "Push-to-Deploy" workflow. By using Bash scripts for initial provisioning and GitHub Actions for continuous delivery, the manual overhead of website maintenance is reduced to zero.

### Key Features
* Infrastructure as Code: Bash script using Azure CLI to provision Resource Groups and Storage Accounts.
* Static Web Hosting: Configured Azure Blob Storage for high-availability web hosting.
* CI/CD Pipeline: GitHub Actions workflow to build the Next.js/Tailwind project and sync files to Azure.
* Automated Troubleshooting: Integrated workflow fixes for Node.js versioning and native binding errors.

---

## 🏗️ Architecture

1. Version Control: GitHub (Main branch)
2. CI/CD Tool: GitHub Actions
3. Cloud Provider: Microsoft Azure
4. Hosting Service: Azure Blob Storage ($web container)
5. Framework: Next.js with Tailwind CSS

---

## 🛠️ Technical Implementation

### 1. Infrastructure Provisioning
The deploy-infra.sh script automates the creation of the environment. It handles:
* Naming conventions and uniqueness for global resources.
* Enabling the static website feature on the storage account.
* Setting the index and 404 error documents.

### 2. CI/CD Workflow (deploy.yml)
The GitHub Action is triggered on every push to the main branch. It performs the following steps:
* Environment Setup: Configures a Linux runner with Node.js 20.
* Build Phase: Installs dependencies and runs npm run build to generate static assets in the /out directory.
* Authentication: Uses a Service Principal stored in GitHub Secrets for secure Azure access.
* Deployment: Syncs the production build to the $web container in Azure Storage.

---

## 🔧 Challenges & Solutions

* Submodule Conflicts: Resolved issues where GitHub treated subfolders as hollow submodules by re-initializing the Git structure and clearing cached indexes.
* Build Environment Errors: Fixed EBADENGINE warnings and native binding failures by upgrading the GitHub Runner to Node.js 20 and implementing a clean-install strategy in the workflow.
* Naming Constraints: Handled Azure Storage naming limitations (24-character limit) by implementing dynamic string slicing in the provisioning script.

---

## 📂 Project Structure

- .github/workflows/
  - deploy.yml              # GitHub Actions CI/CD pipeline
- tailwind-landing-page-template/
  - app/                    # Next.js Application files
  - public/                 # Static assets
  - tailwind.config.ts      # Tailwind configuration
  - package.json            # Project dependencies
- deploy-infra.sh           # Azure CLI Provisioning script
- README.md                 # Project documentation

---

## 🚦 How to Use

### Prerequisites
* Azure CLI installed and configured.
* GitHub Repository with AZURE_CREDENTIALS added to Repository Secrets.

### Deployment
1. Run the provisioning script:
   chmod +x deploy-infra.sh
   ./deploy-infra.sh
2. Push code to the main branch:
   git add .
   git commit -m "Update website content"
   git push origin main

---

## 👨‍💻 Author
**Tomisin Olusesi**
* Cloud & DevOps Engineer
