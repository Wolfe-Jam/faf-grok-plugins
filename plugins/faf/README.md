# faf — Foundational Context Layer for Grok Build

Auto-discovers `project.faf`, scores it with ZEPH, and makes it the single source of truth inside Grok Build sessions.

**Plugin name:** `faf` · **Version:** 1.0.0 · **Layer:** context (`.faf`)

## Install (via marketplace)

```bash
grok plugin marketplace add Wolfe-Jam/faf-grok-plugins
grok plugin install faf --trust
```

See the [marketplace README](../../README.md) for family layout and local-dev install.

## Path first

Scoring is **cwd-relative**. Always report the **absolute path** of `project.faf` before score, tier, or enhance offers.

## What it does

- **SessionStart:** discovers nearest `project.faf`, prints absolute path, writes a receipt
- **Skills:** `faf-context`, `faf-score`
- **MCP:** [grok-faf-mcp](https://github.com/Wolfe-Jam/grok-faf-mcp) at `https://mcpaas.live/grok/mcp/v1` (ZEPH default)

## Dogfood

This plugin directory carries its own `project.faf` (✪ Trophy target).

```bash
cd plugins/faf   # from marketplace root
# in Grok Build: /faf:faf-score
```

## License

MIT — FAF Foundation
