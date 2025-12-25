#!/bin/bash

# Automated Fix and Deploy Script for Property Decision Pack
# Replaces wrong index.html and fixes JavaScript syntax errors

set -e

echo "=== Property Decision Pack - Auto Fix & Deploy ==="
echo ""

# Check we're in the right place
if [ ! -f "model_data.json" ]; then
    echo "❌ Error: Not in property-decision-pack directory"
    echo "Please run: cd ~/property-decision-pack"
    exit 1
fi

echo "✓ Found project directory"

# Backup the old file
echo "📦 Backing up current index.html..."
cp index.html index.html.backup
echo "✓ Backup saved as index.html.backup"

# Check if correct file is in Downloads
if [ ! -f ~/Downloads/index.html ]; then
    echo ""
    echo "❌ index.html not found in Downloads"
    echo ""
    echo "Please download the FIXED index.html from the chat above"
    echo "Look for the 'index' file link and save it to Downloads"
    echo ""
    read -p "Press Enter after downloading..."
    
    if [ ! -f ~/Downloads/index.html ]; then
        echo "❌ Still not found. Aborting."
        exit 1
    fi
fi

# Install the correct file
echo "📝 Installing fixed index.html..."
mv ~/Downloads/index.html .
echo "✓ Fixed index.html installed"

# Verify it's the right file
if ! grep -q "Property decision pack" index.html; then
    echo "❌ Error: This is not the property decision pack file"
    echo "Restoring backup..."
    mv index.html.backup index.html
    exit 1
fi

echo "✅ Verification passed - correct file installed"

# Test locally
echo ""
echo "🧪 Starting local test server..."
python3 run_local_server.py &
SERVER_PID=$!
sleep 3

echo ""
echo "Opening browser at http://localhost:8000/index.html"
open http://localhost:8000/index.html

echo ""
echo "Check that you see:"
echo "  ✓ 'Property decision pack' title (not TROYLATTER)"
echo "  ✓ Blue/white interface with tables"
echo "  ✓ Decision matrix on the right"
echo "  ✓ No JavaScript errors in browser console"
echo ""
read -p "Does it look correct? (y/n): " LOOKS_GOOD

# Stop server
kill $SERVER_PID 2>/dev/null || true
sleep 1

if [ "$LOOKS_GOOD" != "y" ] && [ "$LOOKS_GOOD" != "Y" ]; then
    echo "Restoring backup..."
    mv index.html.backup index.html
    echo "❌ Fix cancelled"
    exit 1
fi

# Commit and push
echo ""
echo "🚀 Deploying to GitHub and Vercel..."
git add index.html
git commit -m "Fix: Replace portfolio with property decision pack and fix syntax errors"
git push origin main

echo ""
echo "✅ Fix Complete!"
echo ""
echo "🎯 Next steps:"
echo "  1. Wait 30 seconds for Vercel to redeploy"
echo "  2. Check: https://property-decision-pack.vercel.app"
echo "  3. You should see the property decision pack (not your portfolio)"
echo ""
echo "💾 Your backup is saved as: index.html.backup"
echo "   Delete it once you confirm everything works"
echo ""
