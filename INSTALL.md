# Property Decision Pack - Installation Instructions

## What You Just Downloaded

You now have a complete, production-ready property decision web app with:
- ✅ Modern, mobile-friendly UI
- ✅ Financial modeling and stress testing
- ✅ Interactive decision matrix
- ✅ Question log system
- ✅ Growth projection scenarios
- ✅ Ready to deploy to Vercel or GitHub Pages

## Installation Steps (5 minutes)

### Step 1: Save All Files

1. Download ALL the files I've provided
2. Create a folder on your Mac: `~/property-decision-pack`
3. Save all files into this folder
4. Your folder should contain:
   - index.html
   - model_data.json
   - setup.sh
   - publish.sh
   - run_local_server.py
   - README.md
   - README.html
   - QUICKSTART.md
   - .gitignore

### Step 2: Add Your Chart Images (Optional)

Create an `assets` folder and add your chart images:

```bash
mkdir ~/property-decision-pack/assets
```

Then copy these files into the assets folder:
- IMG_PropertyGrowthChart_HousesFinance_20251224.jpg
- IMG_PropertyGainChart_HousesFinance_20251224.jpg
- IMG_PortfolioComparison_HousesFinance_20251224.jpg

**Note:** The app works without images - charts just won't display. You can add them later.

### Step 3: Run the Setup Script

Open Terminal and run:

```bash
cd ~/property-decision-pack
chmod +x setup.sh
./setup.sh
```

The setup script will:
- ✅ Initialize git repository
- ✅ Configure GitHub remote
- ✅ Make scripts executable
- ✅ Optionally commit and push to GitHub

**Important:** Before running setup.sh, create your GitHub repo:
1. Go to https://github.com/new
2. Repository name: `property-decision-pack`
3. Make it Private (recommended)
4. Don't initialize with README
5. Click "Create repository"

### Step 4: Test Locally

```bash
python3 run_local_server.py
```

Then open http://localhost:8000/index.html in your browser.

You should see:
- Modern UI with blue/white color scheme
- Top bar with title and goal
- Left column: data tables and charts
- Right column: assumptions, decision matrix, question log

### Step 5: Deploy to Vercel (Recommended)

1. Make sure you pushed to GitHub:
   ```bash
   ./publish.sh
   ```

2. Go to https://vercel.com and sign in with GitHub

3. Click "New Project"

4. Import `property-decision-pack`

5. Configuration:
   - Framework Preset: **Other**
   - Root Directory: `./`
   - Build Command: (leave empty)
   - Output Directory: (leave empty)

6. Click "Deploy"

7. Wait 30 seconds - you'll get a URL like:
   `https://property-decision-pack.vercel.app`

**Alternative: GitHub Pages**

If you prefer GitHub Pages:
1. Push to GitHub (see above)
2. Repo Settings → Pages
3. Source: Deploy from branch `main`
4. Folder: `/` (root)
5. Save

URL will be: `https://yourusername.github.io/property-decision-pack/`

## What This App Does

### For You and Cassandra
- Compare property sale/retention scenarios side-by-side
- Model cashflow under stress conditions
- Visualize 5-10 year property value growth
- Score options together on multiple criteria
- Record questions and agreed answers
- Export decision documentation

### Data Included
All data from your financial modeling:
- Current property values and debts
- Net proceeds from each sale option
- Stress test cashflows and runway weeks
- Repayment sensitivity at different rates
- Fair split rules (50-50, 70-30, etc.)
- Growth projections (3%, 5%, 7% scenarios)

## Making Changes

### Update Numbers
1. Edit `model_data.json` in a text editor
2. Find the section you want to change (e.g., `key_numbers`, `options_recap`)
3. Update the values
4. Save the file
5. Refresh your browser
6. Publish updates: `./publish.sh`

### Update Assumptions
1. Edit the `assumptions` section in `model_data.json`
2. Change values like selling costs, move friction, etc.
3. Save and refresh
4. Export your question log first (it's browser-local)

## Sharing with Cassandra

### Option 1: Send the Vercel URL
Just text her the link:
`https://property-decision-pack.vercel.app`

### Option 2: Share via GitHub
If your repo is private, add her as a collaborator:
1. GitHub repo → Settings → Collaborators
2. Add her GitHub username
3. She can then view/fork/deploy

### Option 3: Export the Question Log
After discussions:
1. Click "Export log json" in the app
2. Email her the `question_log.json` file
3. She can import it on her device

## Troubleshooting

**"Can't find index.html"**
- Make sure you saved all files in the same folder
- Check you're in the right directory: `pwd` should show `/Users/troylatter/property-decision-pack`

**"Charts not showing"**
- Add image files to `assets/` folder
- Check filenames match exactly (case-sensitive)
- App works without images - charts just won't display

**"Data not loading"**
- Check browser console: right-click → Inspect → Console
- Look for errors about `model_data.json`
- Make sure the file is valid JSON (no trailing commas)

**"Can't push to GitHub"**
- Create the repo first: https://github.com/new
- Set up SSH keys: https://docs.github.com/en/authentication
- Run: `ssh -T git@github.com` to test connection

## Next Steps

1. ✅ Test the app locally
2. ✅ Deploy to Vercel or GitHub Pages
3. ✅ Share URL with Cassandra
4. ✅ Use the decision matrix together
5. ✅ Record questions in the question log
6. ✅ Export the log after important discussions

## Support

- **Full documentation:** Open `README.html` in your browser
- **Quick reference:** See `QUICKSTART.md`
- **Technical help:** Check `README.md`

## Security Note

This app:
- ✅ Runs entirely in the browser (no server)
- ✅ Question log stored locally (browser localStorage)
- ✅ No data sent to external services
- ✅ Can be hosted privately on GitHub/Vercel
- ✅ Recommended: Make GitHub repo private

---

**Ready?** Start with `./setup.sh` in Terminal!
