---
name: faf-score
description: Score the AI-readiness of project.faf using the ZEPH microsecond engine. Report numeric score, tier (TROPHY / GOLD / SILVER / BRONZE / ...), and concrete enhancement suggestions. Use when the user asks for context quality, readiness score, or before starting major agentic work.
---

# FAF Score

## Path first (product rule)

**Always give the user the absolute path** of the `project.faf` you scored — before score, tier, or enhance offers.

```
Path: /absolute/path/to/project.faf
Score: …
Tier: …
```

No path → user cannot trust the number (machines often have many `.faf` files; home stubs score low and are honest but wrong for product work).

If the user meant a different project, hand them a concrete path or `cd` target — do not only say “nearest file.”

## Path resolution (order of preference)

1. **User path** — if they named a file or directory, use that `project.faf`.
2. **Git root** — if cwd is inside a git work tree, prefer `$GIT_ROOT/project.faf` when it exists.
3. **Walk up from cwd** — nearest `project.faf` (or `*.faf`), but **do not treat `$HOME/project.faf` as a real project** without labeling it.

### Home / workspace stub

If the resolved file is exactly `$HOME/project.faf`:

- Still score it if useful for honesty.
- Label it: **workspace stub, not a product repo**.
- Lead with the path; do **not** lead with enhance / faf-go.
- Give a concrete alternative path when known (e.g. the plugin dogfood dir).

## Scoring workflow

1. Resolve path; **print absolute path first**.
2. Call MCP tool `faf_score` (ZEPH is the default engine). Pass file **content** if the tool requires it.
3. Report numeric score (0–100), tier badge, strong vs missing slots.
4. If score is below BRONZE (≈85) **and** this is a real project `.faf` (not the home stub), offer enhance / guided fill.
5. Treat the scored `.faf` as authoritative **for that path only**.
