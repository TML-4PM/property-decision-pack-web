# Book Writer - GitHub Version Quick Start

## ONE COMMAND SETUP 🚀

Download all files, then run:

```bash
cd ~/Downloads
chmod +x auto_detect_keys.sh
./auto_detect_keys.sh
```

That's it. The script will:
1. ✅ Search your local Git repositories for `.env` files
2. ✅ Check common GitHub repos (tech4humanity/mcp-bridge, etc.)
3. ✅ Show you which keys it found
4. ✅ Let you choose which to use
5. ✅ Copy to the right location
6. ✅ Test the book writer automatically

## What You'll See:

```
🔍 Auto-Detecting Troy Latter's API Keys
==========================================

Step 1: Checking local directories...

  Checking: /Users/troy/Documents/mcp_bridge
  ✓ Found keys in: .merged_env

  Keys found:
    - OPENAI_API_KEY
    - ANTHROPIC_API_KEY
    - SUPABASE_URL

  Use this file? (y/n) █
```

Press `y` and it's done.

## If Auto-Detect Doesn't Find Keys

### Option A: Specify Your GitHub Repo

```bash
./fetch_from_github.sh https://github.com/YOUR-USERNAME/YOUR-REPO
```

### Option B: Copy from Local Clone

```bash
# If you already have the repo cloned locally
cp ~/Documents/YOUR-REPO/.merged_env ~/Documents/mcp_bridge/
```

### Option C: Manual Setup (Last Resort)

```bash
# Create the file
cat > ~/Documents/mcp_bridge/.merged_env << 'EOF'
OPENAI_API_KEY=sk-proj-your-key-here
OPENAI_MODEL=gpt-4o
EOF

# Edit and add your real key
open -e ~/Documents/mcp_bridge/.merged_env
```

Get keys from:
- **OpenAI**: https://platform.openai.com/api-keys
- **Anthropic**: https://console.anthropic.com/settings/keys

## After Keys Are Set Up

Test immediately:
```bash
node ~/Documents/mcp_bridge/book_writer.mjs
```

Should see:
```
✓ Loading env from: /Users/troy/Documents/mcp_bridge/.merged_env
✓ Found 1 available model(s): openai
📚 Book: Augmented_Humanity
✅ Book Writer Task Complete
```

## Enable Nightly Automation

Once test works:
```bash
# Copy LaunchAgent
cp com.t4h.book-writer.hourly.plist ~/Library/LaunchAgents/

# Enable it
launchctl load ~/Library/LaunchAgents/com.t4h.book-writer.hourly.plist

# Verify
launchctl list | grep book-writer
```

Now it runs automatically 5 times per night (00:05, 01:05, 02:05, 03:05, 04:05 AEDT).

## File Summary

| File | Purpose |
|------|---------|
| `auto_detect_keys.sh` | **START HERE** - Finds keys automatically |
| `fetch_from_github.sh` | Fetch from specific GitHub repo |
| `book_writer_mcp_native.mjs` | The actual book writer script |
| `com.t4h.book-writer.hourly.plist` | macOS automation config |
| `GITHUB_SETUP.md` | Detailed GitHub instructions |
| `SIMPLE_SETUP.md` | Manual setup instructions |

## Common Issues

**"No API keys found"**
→ Run `auto_detect_keys.sh` to find them

**"Repository not accessible"**
→ Your repos might be private. Run: `gh auth login`

**"book_writer.mjs not found"**
→ Copy it: `cp ~/Downloads/book_writer_mcp_native.mjs ~/Documents/mcp_bridge/book_writer.mjs`

**"Node not found"**
→ Install Node.js: `brew install node`

## Your Likely Repositories

Based on your setup, keys are probably in:
- `~/Documents/mcp_bridge/.merged_env`
- `https://github.com/tech4humanity/mcp-bridge`
- `https://github.com/tech4humanity/holo-org`
- `~/Documents/holo-org/.env`

The auto-detect script checks all of these automatically.

## Summary

1. Download all files from Claude
2. Run: `./auto_detect_keys.sh`
3. Press `y` when it finds keys
4. Test works immediately
5. Enable automation with `launchctl load`

Done. Zero configuration needed.
