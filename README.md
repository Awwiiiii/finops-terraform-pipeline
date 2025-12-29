# 💰 Budget-Aware CI/CD Pipeline (FinOps + DevOps)

> **"Shift-Left" your cloud costs by catching expensive architectural decisions and security risks before they hit production.**

## 📝 Overview
This project implements a **FinOps-driven CI/CD strategy**. By integrating **Infracost** into **GitHub Actions**, every infrastructure change proposed via **Terraform** is automatically audited for its financial impact and security compliance. 

Instead of waiting for a monthly bill, this pipeline provides real-time feedback directly within Pull Requests, fostering a culture of cost-accountability and proactive governance.

---

## 🛠 Tech Stack
* **IaC:** Terraform
* **CI/CD:** GitHub Actions
* **FinOps Tooling:** Infracost Cloud
* **Cloud Provider:** AWS (Scalable to Azure/GCP)

---

## 🚀 How It Works
1.  **Code Change:** A developer modifies the Terraform configuration (e.g., upgrading an instance size).
2.  **Pull Request:** A PR is opened, triggering the GitHub Actions workflow.
3.  **Cost & Security Analysis:** * **Infracost** calculates the cost difference (delta) between the current state and the proposed change.
    * The pipeline checks the configuration against **Cloud Security Policies**.
4.  **Reporting:** An automated report is posted as a comment on the PR.
5.  **Enforcement:** If the cost increase exceeds a defined **Budget Guardrail** (e.g., $250/mo), the pipeline flags a failure for manual review.

---

## 📊 Live Project Results
The pipeline was successfully tested with a real-world infrastructure upgrade, yielding the following insights:

* **Financial Impact Detected:** Identified a monthly cost increase of **$1,121.00 (+196%)**.
* **Budget Guardrail Triggered:** The build was flagged because the increase exceeded the **$250.00 threshold**.
* **Security Violation Caught:** Detected an insecure configuration involving a **Public IPv4 address** on an EC2 instance.
* **Environmental Impact:** Estimated a carbon footprint increase of **35.9 kg CO2e** (equivalent to driving 142.9 km).

---

## ⚙️ Setup & Installation

### 1. Prerequisites
* [Infracost API Key](https://www.infracost.io/) (Free)
* **GitHub Secrets:** Add your `INFRACOST_API_KEY` to your repository settings under *Secrets and Variables > Actions*.

### 2. Local Setup
```bash

# Clone the repository
git clone [https://github.com/Awwiiiii/finops-terraform-pipeline.git](https://github.com/Awwiiiii/finops-terraform-pipeline.git)

# Initialize Terraform
terraform init
```

3. CI/CD Configuration
The logic is defined in .github/workflows/infracost.yml. It handles the automated checkout, cost breakdown generation, and PR commenting.

💡 Key Learnings
FinOps Principles: Understanding how to shift cost management "left" to empower engineering teams.

Policy as Code: Implementing automated guardrails to ensure both financial and security compliance.

CI/CD Orchestration: Designing workflows that provide actionable data to developers within their existing tools.

🤝 Contributing
Contributions are welcome! If you have ideas for adding Slack alerts or supporting additional cloud providers, feel free to fork this project and submit a PR.
