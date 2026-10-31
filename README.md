# FizzBuzz Case Study (Azure DevOps)

A clean, tested Python implementation of the FizzBuzz interview problem with an Azure DevOps CI/CD pipeline (`azure-pipelines.yml`) and Backlog Refinement notes (`backlog-refinement.txt`).

## Story Point Estimation

**Estimate: 2 Story Points** (Fibonacci scale: 1, 2, 3, 5, 8, 13, 21)

* **Why 2 Points?** The core FizzBuzz logic is simple and deterministic (1 point), while structuring it for testability, writing thorough unit tests, configuring a multi-stage Azure DevOps YAML pipeline with JUnit test/coverage publishing, and documenting backlog refinement adds a small, predictable amount of engineering work.

## Repository Structure

* `fizzbuzz.py` — FizzBuzz implementation (`evaluate_number`, `generate_sequence`, and CLI entrypoint).
* `test_fizzbuzz.py` — Unit test suite covering all acceptance criteria, boundary conditions, stdout output, and invalid input handling.
* `azure-pipelines.yml` — Two-stage Azure DevOps pipeline (`Test` stage runs unit tests and publishes results/coverage; `Run` stage executes `fizzbuzz.py`).
* `backlog-refinement.txt` — Story point estimation rationale and proposals for improving the feature during a Backlog Refinement session.

## Running Locally

### Run Unit Tests
```bash
python3 -m unittest discover -v
```

### Run the FizzBuzz Script
```bash
python3 fizzbuzz.py
```

