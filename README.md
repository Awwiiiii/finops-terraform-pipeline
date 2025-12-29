Budget-Aware CI/CD Pipeline (FinOps + DevOps)

Overview

This project implements a **"Shift-Left" FinOps strategy**. It integrates cost-visibility directly into the DevOps lifecycle. By using **Infracost** within a **GitHub Actions** pipeline, every infrastructure change proposed via **Terraform** is automatically audited for its financial impact before it is deployed.

The Problem

Cloud costs are often an afterthought, discovered only when the monthly bill arrives. Large, expensive resources can be provisioned by a single line of code, leading to "bill shock."

### The Solution

This pipeline intercepts Pull Requests and leaves a detailed comment showing the **monthly cost increase/decrease**. It empowers developers to be "cost-aware" and allows teams to set budget guardrails that block deployments if they exceed a specific price threshold.

---

## 🛠 Tech Stack

* **IaC:** Terraform
* **CI/CD:** GitHub Actions
* **FinOps Tooling:** Infracost
* **Cloud Provider:** AWS (Scalable to Azure/GCP)

---

## 🚀 How It Works

1. **Code Change:** A developer modifies `main.tf` (e.g., upgrading an EC2 instance type).
2. **Pull Request:** The developer pushes a branch and opens a PR.
3. **Cost Analysis:** GitHub Actions triggers a job that:
* Authenticates with Infracost.
* Calculates the cost of the *baseline* (current state).
* Calculates the cost of the *proposed* changes.


4. **Reporting:** The pipeline posts a formatted table to the PR comments showing the monthly cost delta.
5. **Enforcement:** (Optional) The build fails if the cost increase is greater than **$500/mo**.

---

## ⚙️ Setup & Installation

### 1. Prerequisites

* [Infracost API Key](https://www.google.com/search?q=https://www.infracost.io/docs/%232-get-api-key) (Free)
* GitHub Repository with Secrets configured:
* `INFRACOST_API_KEY`: Your Infracost API key.



### 2. Local Setup

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/finops-terraform-pipeline.git

# Initialize Terraform
terraform init

```

### 3. Pipeline Configuration

The workflow is located in `.github/workflows/infracost.yml`. It handles the logic for comparing the PR branch against the main branch.

---

## 📊 Example Output

When a PR is opened, Infracost generates a comment like this:

| Resource | Unit | Old Qty | New Qty | Old Cost | New Cost | Delta |
| --- | --- | --- | --- | --- | --- | --- |
| **aws_instance.web_server** | Instance hour | 730 | 730 | $146.00 | $292.00 | +$146.00 |
| **Total Monthly Cost** |  |  |  | **$146.00** | **$292.00** | **+$146.00** |

---

## 💡 Key Learnings

* **FinOps Principles:** Understanding how to manage cloud spend through engineering culture.
* **CI/CD Automation:** Mastering complex GitHub Actions workflows with conditional logic.
* **Policy as Code:** Implementing automated cost-governance without slowing down development.

---

## 🤝 Contributing

Feel free to fork this project and add your own guardrails or support for other cloud providers!
