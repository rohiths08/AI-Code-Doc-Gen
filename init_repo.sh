#!/bin/bash
# init_repo.sh (v3)

mkdir -p .github/workflows
mkdir -p data/raw data/processed data/samples
mkdir -p notebooks
mkdir -p src/data src/models src/deploy src/utils
mkdir -p deployment
mkdir -p results/sample_outputs
mkdir -p reports/Phase_I reports/Phase_II
mkdir -p scripts
mkdir -p environment

# placeholder files
touch data/.gitkeep notebooks/.gitkeep src/.gitkeep deployment/.gitkeep results/.gitkeep reports/.gitkeep scripts/.gitkeep environment/.gitkeep

# base files
echo "# AI-Code-Doc-Gen" > README.md
echo "__pycache__/" > .gitignore
echo "*.ipynb_checkpoints/" >> .gitignore
echo "data/raw/" >> .gitignore
echo "data/processed/" >> .gitignore
echo "results/" >> .gitignore
echo "MIT License" > LICENSE

# ✅ Add default CI workflow instead of empty file
cat <<EOL > .github/workflows/ci.yml
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: "3.10"

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

      - name: Run tests
        run: |
          echo "✅ No tests yet, workflow works fine!"
EOL

echo "✅ Repo initialized successfully!"
