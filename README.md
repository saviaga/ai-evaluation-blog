# AI Evaluation Blog

🛡️ Building evaluation infrastructure that keeps advanced AI aligned

## About

This blog documents my journey building practical AI evaluation tools — from chain-of-thought faithfulness to multi-agent governance, from research prototypes to production systems.

## Structure

- `index.html` — Main blog page
- `about.html` — About page
- `posts/` — Individual blog posts
- `css/` — Styling
- `generate-post.sh` — Script to create new posts
- `ai_evaluation_blog.sh` — Script to publish to GitHub Pages

## Usage

### Creating a New Post

```bash
./generate-post.sh "Post Title" "<p>Post content...</p>" "post-slug"
```

### Publishing

```bash
./ai_evaluation_blog.sh
```

## GitHub Pages

This blog is set up to be published via GitHub Pages. After pushing to the `main` branch, it will be available at:

`https://saviaga.github.io/ai-evaluation-blog/`

## Current Focus Areas

- Chain-of-thought faithfulness evaluation
- Inter-query attack detection
- LLM judge bias profiling
- Deceptive alignment measurement
- Behavioral anomaly detection
- Multi-agent alignment

## Content Plan (2026)

1. When LLMs Lie About Their Reasoning: Measuring CoT Faithfulness
2. Beyond Single-Query Protection: Detecting Coordinated LLM Attacks  
3. Your LLM Judge Is Biased: A Quantitative Analysis
4. Can Your Model Tell It's Being Tested? Mine Can.
5. Building an Early Warning System for LLM Behavior Drift
6. Benchmarks Lie: What Models Actually Can and Can't Do
7. I Tried to Make GPT-4 Forget — Here's What Happened
8. Emergent Misalignment: When AI Agents Collaborate
9. 9 Months Building AI Evaluation Tools
10. The State of AI Evaluation: A Practitioner's View