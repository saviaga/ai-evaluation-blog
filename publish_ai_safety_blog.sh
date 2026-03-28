#!/bin/bash
# Publish AI Safety Blog to GitHub Pages

BLOG_DIR="/home/node/.openclaw/workspace/ai-safety-blog"
cd "$BLOG_DIR"

echo "Publishing AI Safety Blog..."

# Add all changes
git add .

# Commit with timestamp
TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M UTC")
git commit -m "Blog update: $TIMESTAMP"

# Push to GitHub (main branch for GitHub Pages)
git push origin main

echo "✅ Blog published to GitHub Pages"
echo "🌐 View at: https://saviaga.github.io/ai-safety-blog/"