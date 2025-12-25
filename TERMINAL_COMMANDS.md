# Terminal Commands Reference

## Initial Setup (Run Once)

```bash
# 1. Navigate to project folder
cd ~/property-decision-pack

# 2. Run setup script
chmod +x setup.sh
./setup.sh

# Follow the prompts - it will:
# - Initialize git
# - Add GitHub remote
# - Optionally commit and push
```

## Daily Usage

### Test Locally
```bash
cd ~/property-decision-pack
python3 run_local_server.py
# Opens at http://localhost:8000/index.html
# Press Ctrl+C to stop
```

### Publish Changes
```bash
cd ~/property-decision-pack
./publish.sh
# You'll be prompted for a commit message
# Script will git add, commit, and push
```

### Manual Git Operations
```bash
# Check status
git status

# Stage all changes
git add -A

# Commit with message
git commit -m "Updated property values"

# Push to GitHub
git push origin main

# View commit history
git log --oneline -10
```

## File Management

### List Files
```bash
cd ~/property-decision-pack
ls -lah
```

### Edit Data File
```bash
# Using nano (simple)
nano model_data.json
# Edit, then: Ctrl+O (save), Enter, Ctrl+X (exit)

# Using VS Code (if installed)
code model_data.json

# Using TextEdit (Mac default)
open -a TextEdit model_data.json
```

### Add Chart Images
```bash
cd ~/property-decision-pack
mkdir -p assets
# Then drag images into the assets folder via Finder
# Or use cp command:
cp ~/Downloads/IMG_PropertyGrowthChart*.jpg assets/
```

## Deployment

### Deploy to Vercel (via Terminal)
```bash
# Install Vercel CLI (first time only)
npm install -g vercel

# Deploy
cd ~/property-decision-pack
vercel
# Follow prompts
```

### Deploy to GitHub Pages
```bash
# Just push to GitHub
./publish.sh

# Then enable Pages in repo settings:
# Settings → Pages → Source: main → Folder: / (root)
```

## Troubleshooting

### Permission Denied
```bash
chmod +x setup.sh publish.sh run_local_server.py
```

### Git Remote Already Exists
```bash
# View current remote
git remote -v

# Remove old remote
git remote remove origin

# Add new remote
git remote add origin git@github.com:troylatter/property-decision-pack.git
```

### Reset Local Changes
```bash
# Discard all local changes (careful!)
git reset --hard HEAD

# Discard changes to specific file
git checkout -- model_data.json
```

### View Recent Commits
```bash
git log --oneline -10
```

### Create New Branch
```bash
# For testing changes safely
git checkout -b test-changes
# Make changes, test
# Switch back: git checkout main
```

## Quick Fixes

### Charts Not Showing
```bash
# Check if images exist
ls -la assets/

# Check filenames match exactly
# Expected:
# - IMG_PropertyGrowthChart_HousesFinance_20251224.jpg
# - IMG_PropertyGainChart_HousesFinance_20251224.jpg
# - IMG_PortfolioComparison_HousesFinance_20251224.jpg
```

### JSON Validation Error
```bash
# Install jq (JSON validator)
brew install jq

# Validate model_data.json
jq . model_data.json

# If error, it will show the line number
```

### Start Fresh
```bash
cd ~
rm -rf property-decision-pack
# Then re-download all files and start over
```

## Useful Shortcuts

```bash
# Create alias for quick server start
echo 'alias propserve="cd ~/property-decision-pack && python3 run_local_server.py"' >> ~/.zshrc
source ~/.zshrc
# Now you can just type: propserve

# Create alias for quick publish
echo 'alias proppub="cd ~/property-decision-pack && ./publish.sh"' >> ~/.zshrc
source ~/.zshrc
# Now you can just type: proppub
```

## Safety Checks

```bash
# Before committing, review changes
git diff

# See what will be committed
git status

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1
```

---

**Tip:** Keep this file open in a separate window while working in Terminal!
