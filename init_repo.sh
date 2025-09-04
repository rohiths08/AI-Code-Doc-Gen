#!/bin/bash
<<<<<<< HEAD
# init_repo.sh (v3)
=======
# init_repo.sh (v4)
>>>>>>> 91a25f3 (Fix init script with proper Python CI workflow)

# Create directory structure
mkdir -p .github/workflows
mkdir -p data/raw data/processed data/samples
mkdir -p notebooks
mkdir -p src/data src/models src/deploy src/utils
mkdir -p deployment
mkdir -p results/sample_outputs
mkdir -p reports/Phase_I reports/Phase_II
mkdir -p scripts
mkdir -p environment

# Placeholder files
touch data/.gitkeep notebooks/.gitkeep src/.gitkeep deployment/.gitkeep results/.gitkeep reports/.gitkeep scripts/.gitkeep environment/.gitkeep

# Base files
echo "# AI-Code-Doc-Gen" > README.md
echo "__pycache__/" > .gitignore
echo "*.ipynb_checkpoints/" >> .gitignore
echo "data/raw/" >> .gitignore
echo "data/processed/" >> .gitignore
echo "results/" >> .gitignore
echo "MIT License" > LICENSE

<<<<<<< HEAD
# ✅ Add default CI workflow instead of empty file
# ✅ Add default CI workflow
echo "name: CI
on:
  push:
  pull_request:
=======
# ✅ Add default Python CI workflow
cat > .github/workflows/ci.yml <<'EOF'
name: CI

on:
  push:
  pull_request:

>>>>>>> 91a25f3 (Fix init script with proper Python CI workflow)
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v3
<<<<<<< HEAD
=======

>>>>>>> 91a25f3 (Fix init script with proper Python CI workflow)
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.10'
<<<<<<< HEAD
=======

>>>>>>> 91a25f3 (Fix init script with proper Python CI workflow)
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
<<<<<<< HEAD
      - name: Run tests
        run: echo '✅ CI workflow works!'
" > .github/workflows/ci.yml

=======

      - name: Run tests
        run: echo "✅ CI workflow works!"
EOF
>>>>>>> 91a25f3 (Fix init script with proper Python CI workflow)

echo "✅ Repo initialized successfully!"
