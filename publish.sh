#!/usr/bin/env bash
set -euo pipefail

git add index.html model_data.json README.md README.html assets
git status

read -rp "Commit message: " MSG
git commit -m "$MSG"
git push origin main
