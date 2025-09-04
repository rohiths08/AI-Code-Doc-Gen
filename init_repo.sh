#!/bin/bash
# init_repo.sh (v2)

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
touch .github/workflows/ci.yml
touch data/.gitkeep notebooks/.gitkeep src/.gitkeep deployment/.gitkeep results/.gitkeep reports/.gitkeep scripts/.gitkeep environment/.gitkeep

# base files
echo "# AI-Code-Doc-Gen" > README.md
echo "__pycache__/" > .gitignore
echo "*.ipynb_checkpoints/" >> .gitignore
echo "data/raw/" >> .gitignore
echo "data/processed/" >> .gitignore
echo "results/" >> .gitignore
echo "MIT License" > LICENSE

echo "✅ Repo initialized successfully!"
