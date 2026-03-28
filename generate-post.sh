#!/bin/bash
# Generate an AI Safety blog post and update the index
BLOG_DIR="/home/node/.openclaw/workspace/ai-evaluation-blog"
POSTS_DIR="$BLOG_DIR/posts"
DATE=$(date -u +"%Y-%m-%d")
TIME=$(date -u +"%H%M%S")
SLUG="$3"  # Use provided slug or generate one
if [ -z "$SLUG" ]; then
  SLUG="post-${DATE}-${TIME}"
fi
PRETTY_DATE=$(date -u +"%B %d, %Y at %H:%M UTC")

# Post content is passed as arguments
TITLE="$1"
BODY="$2"

mkdir -p "$POSTS_DIR"

cat > "$POSTS_DIR/${SLUG}.html" <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${TITLE} — AI Safety Evaluation Blog</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>
  <a href="../index.html" class="back">← Back to blog</a>
  <article class="post-content">
    <h1>${TITLE}</h1>
    <time>${PRETTY_DATE}</time>
    ${BODY}
  </article>
  <footer>
    <p>Built with ☕ and code · <a href="https://github.com/saviaga">@saviaga</a></p>
  </footer>
</body>
</html>
EOF

# Rebuild index - collect all posts sorted by filename (newest first)
cat > "$BLOG_DIR/index.html" <<'HEADER'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>AI Safety Evaluation Blog</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header>
    <h1>🛡️ AI Safety Evaluation</h1>
    <p class="subtitle">Building evaluation infrastructure that keeps advanced AI aligned</p>
    <nav><a href="about.html">About</a> | <a href="research.html">Research</a></nav>
  </header>
  <div class="layout">
    <main>
      <p>Welcome to my AI evaluation blog. I build the evaluation infrastructure that keeps advanced AI aligned — from chain-of-thought faithfulness to multi-agent governance, from research prototypes to production systems.</p>
      
      <h2>Recent Posts</h2>
HEADER

if [ -d "$POSTS_DIR" ] && [ "$(ls -A $POSTS_DIR 2>/dev/null)" ]; then
  for f in $(ls -r "$POSTS_DIR"/*.html 2>/dev/null || echo ""); do
    if [ -f "$f" ]; then
      post_title=$(grep -oP '(?<=<h1>).*(?=</h1>)' "$f" | head -1)
      post_time=$(grep -oP '(?<=<time>).*(?=</time>)' "$f" | head -1)
      post_preview=$(grep -oP '<p>.*?</p>' "$f" | head -2 | tr '\n' ' ')
      post_file=$(basename "$f")
      cat >> "$BLOG_DIR/index.html" <<ENTRY
      <article>
        <h2><a href="posts/${post_file}">${post_title}</a></h2>
        <time>${post_time}</time>
        ${post_preview}
        <a href="posts/${post_file}" class="read-more">Read more →</a>
      </article>
ENTRY
    fi
  done
else
  cat >> "$BLOG_DIR/index.html" <<NOPOST
      <p><em>No posts yet. Check back soon for AI evaluation insights!</em></p>
NOPOST
fi

cat >> "$BLOG_DIR/index.html" <<'MIDDLE'
    </main>
    <aside>
      <h3>Current Focus</h3>
      <ul>
        <li>Chain-of-thought faithfulness evaluation</li>
        <li>Inter-query attack detection</li>
        <li>LLM judge bias profiling</li>
        <li>Deceptive alignment measurement</li>
      </ul>
      
      <h3>Projects</h3>
      <ul>
        <li><a href="https://github.com/saviaga/cot-faithfulness-eval">CoT Faithfulness Evaluator</a></li>
        <li><a href="https://github.com/saviaga/inter-query-detector">Inter-Query Attack Detector</a></li>
        <li><a href="https://github.com/saviaga/judge-bias-profiler">LLM Judge Bias Profiler</a></li>
      </ul>
    </aside>
  </div>
  <footer>
    <p>Built with ☕ and code · <a href="https://github.com/saviaga">@saviaga</a></p>
  </footer>
</body>
</html>
MIDDLE

echo "✅ Generated post: ${SLUG}.html"
echo "📝 Updated index with latest posts"