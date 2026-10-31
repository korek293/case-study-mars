# FizzBuzz Case Study (Azure DevOps & Terraform)

A clean, tested Python implementation of the FizzBuzz problem (1 to 100), automated with an **Azure DevOps CI pipeline** and provisioned via **Terraform** (`azure_infra/`).

## Story Point Estimation
- **2 Story Points** for the core script, unit tests and CI pipeline (or **3 Story Points** including Azure infrastructure provisioning). See [`backlog_refinement.txt`](backlog_refinement.txt) for full rationale and refinement improvements.

## Repository Structure
- `fizzbuzz.py` — Core FizzBuzz evaluation and printing logic.
- `test_fizzbuzz.py` — Unit test suite built with `pytest`.
- `requirements.txt` — Pinned test dependencies (`pytest`).
- `azure-pipelines.yml` — Azure DevOps CI pipeline (installs dependencies, runs unit tests with JUnit XML reporting, and executes the script).
- `azure_infra/` — Terraform configuration provisioning the Azure Resource Group, Storage Account + Blob Container (for remote `.tfstate`), and Azure DevOps Project, GitHub connection, and Build Pipeline.
- `backlog_refinement.txt` — Story Point Estimation and Backlog Refinement improvement proposals.

## Running Locally

### 1. Run the FizzBuzz Script
```bash
python3 fizzbuzz.py
```

### 2. Run the Unit Tests
```bash
pip install -r requirements.txt
pytest test_fizzbuzz.py -v
```

## Infrastructure Deployment (`azure_infra/`)
Terraform provisions the minimal Azure and Azure DevOps resources and stores state remotely in an Azure Storage Blob Container (`tfstate`):
```bash
cd azure_infra
terraform init
terraform apply -var="github_personal_access_token=$GITHUB_TOKEN"
```

