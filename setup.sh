#!/bin/bash

# Property Decision Pack - Complete Setup Script
# Run this on your Mac to set up the project and deploy to GitHub

set -e  # Exit on error

echo "=== Property Decision Pack - Setup ==="
echo ""

# Check if we're in the right directory
if [ ! -f "index.html" ] || [ ! -f "model_data.json" ]; then
    echo "Error: index.html or model_data.json not found"
    echo "Please run this script from the property-decision-pack directory"
    exit 1
fi

echo "✓ Found project files"
echo ""

# Check for required chart images
echo "Checking for chart images in assets/..."
MISSING_IMAGES=0
for img in \
    "IMG_PropertyGrowthChart_HousesFinance_20251224.jpg" \
    "IMG_PropertyGainChart_HousesFinance_20251224.jpg" \
    "IMG_PortfolioComparison_HousesFinance_20251224.jpg"; do
    
    if [ ! -f "assets/$img" ]; then
        echo "⚠ Missing: assets/$img"
        MISSING_IMAGES=1
    else
        echo "✓ Found: assets/$img"
    fi
done

if [ $MISSING_IMAGES -eq 1 ]; then
    echo ""
    echo "Warning: Some chart images are missing"
    echo "The app will work but charts won't display"
    echo "You can add them later to the assets/ folder"
    echo ""
fi

# Initialize git if needed
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
    git branch -M main
    echo "✓ Git repository initialized"
else
    echo "✓ Git repository already exists"
fi

# Check for git remote
if ! git remote | grep -q "origin"; then
    echo ""
    echo "Setting up GitHub remote..."
    read -p "Enter your GitHub username [troylatter]: " GITHUB_USER
    GITHUB_USER=${GITHUB_USER:-troylatter}
    
    git remote add origin "git@github.com:${GITHUB_USER}/property-decision-pack.git"
    echo "✓ Added remote: git@github.com:${GITHUB_USER}/property-decision-pack.git"
else
    echo "✓ Git remote already configured"
fi

# Make scripts executable
echo ""
echo "Making scripts executable..."
chmod +x publish.sh run_local_server.py
echo "✓ Scripts are now executable"

# Create .gitignore
if [ ! -f ".gitignore" ]; then
    echo ""
    echo "Creating .gitignore..."
    cat > .gitignore << 'EOF'
.DS_Store
*.swp
*.swo
*~
.vscode/
.idea/
EOF
    echo "✓ Created .gitignore"
fi

# Show status
echo ""
echo "=== Current Status ==="
git status

# Offer to commit and push
echo ""
read -p "Do you want to commit and push to GitHub now? (y/n): " PUSH_NOW

if [ "$PUSH_NOW" = "y" ] || [ "$PUSH_NOW" = "Y" ]; then
    echo ""
    read -p "Commit message [Initial property decision pack]: " COMMIT_MSG
    COMMIT_MSG=${COMMIT_MSG:-"Initial property decision pack"}
    
    git add -A
    git commit -m "$COMMIT_MSG"
    
    echo ""
    echo "Pushing to GitHub..."
    echo "Note: You may need to create the repo on GitHub first"
    echo "Visit: https://github.com/new"
    echo ""
    
    if git push -u origin main; then
        echo ""
        echo "✓ Successfully pushed to GitHub!"
    else
        echo ""
        echo "⚠ Push failed - you may need to:"
        echo "  1. Create the repo on GitHub: https://github.com/new"
        echo "  2. Set up SSH keys: https://docs.github.com/en/authentication"
        echo "  3. Then run: git push -u origin main"
    fi
fi

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Next steps:"
echo ""
echo "1. Test locally:"
echo "   python3 run_local_server.py"
echo "   Then open http://localhost:8000/index.html"
echo ""
echo "2. Deploy to Vercel:"
echo "   - Visit https://vercel.com"
echo "   - Import your GitHub repo"
echo "   - Framework: Other"
echo "   - Deploy"
echo ""
echo "3. OR deploy to GitHub Pages:"
echo "   - Go to your repo Settings → Pages"
echo "   - Source: Deploy from branch 'main'"
echo "   - Folder: / (root)"
echo ""
echo "4. To update and republish later:"
echo "   ./publish.sh"
echo ""
