# TaskFlow — GitHub Workflow Practice Repo

A single static landing page (plain HTML + CSS, no JavaScript, no build step)
used as the **practice repository** for the "GitHub Workflow" class session —
forking, issues, branches, pull requests, and code review.

This repo is **intentionally broken**. It contains **49 seeded bugs** — wrong
colors, broken alignment/spacing, and typos/content mistakes — each one
tracked as a GitHub Issue. Your job is to pick an issue, fix it on a branch,
and open a pull request back to the class repo.

## Viewing the page

No build step, no dependencies. Just open the file in a browser:

```bash
open index.html         # macOS
start index.html        # Windows
xdg-open index.html     # Linux
```

## Project structure

```
├── index.html          # Page content and structure
├── css/style.css        # All styling (design tokens in :root)
└── assets/logo.svg      # Logo
```

## How to contribute (workflow recap)

1. **Fork** this repository to your own account.
2. **Clone** your fork locally.
3. Pick an open **Issue** from the Issues tab and assign it to yourself.
4. Create a **branch** named after the issue, e.g. `fix/issue-12-badge-color`.
5. Fix the bug and check it in the browser.
6. **Commit & push**, then open a **Pull Request** back to this repo. Reference
   the issue in your PR description, e.g. `Closes #12`.
7. Swap with a partner for **code review** — leave at least one comment before
   approving.

## Bug categories

| Label | Description |
|---|---|
| `bug: color` | Wrong colors, contrast issues, invisible text, missing hover feedback |
| `bug: alignment` | Flex/grid/spacing problems, misaligned or uneven elements |
| `bug: text` | Typos, grammar mistakes, leftover placeholder copy, inconsistent wording |
| `good first issue` | Small, beginner-friendly fixes — usually a one-line change |

## Tips

- Most fixes are a single line in `css/style.css` or `index.html`.
- Fix **one issue at a time**, on its own branch.
- It's fine if other unrelated bugs are still visible while you test your fix
  — that's expected in a shared codebase.

## License

MIT — see [LICENSE](LICENSE).
