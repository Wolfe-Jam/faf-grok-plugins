# faf-grok-plugins

**Canonical FAF ecosystem plugins for [Grok Build](https://x.ai).**

One marketplace. Install only what you need. Cascade the rest without new repos.

| Plugin | Layer | Format | Status |
|--------|--------|--------|--------|
| **faf** | Context | `.faf` | **v1.0.0** — live |
| **fafm** | Memory | `.fafm` | later → `plugins/fafm/` |
| **fafa** | Agent | `.fafa` | later → `plugins/fafa/` |

## Install

```bash
# 1. Add the marketplace (once)
grok plugin marketplace add Wolfe-Jam/faf-grok-plugins

# 2. Install the context plugin
grok plugin install faf --trust
```

Reload plugins in Grok Build (`/plugins` → **r**) or start a new session.

### Local path (dev)

```bash
grok plugin marketplace add /path/to/faf-grok-plugins
grok plugin install faf --trust
```

## Family

- **faf** — Foundational Context Layer (`project.faf`, ZEPH scoring, SessionStart discovery)
- **faf-memory / fafm** — Permanent Memory Layer (Claude package exists; Grok folder later)
- **faf-agent / fafa** — Agent identity layer (later)

Each product lands at **1.0.0** and versions independently. Names carry identity; versions track that package only.

## Path first

Skills and SessionStart always surface the **absolute path** of the `project.faf` in use. Scoring is cwd-relative — `cd` into the project (or pass a path) before treating a score as product DNA.

## Layout

```text
faf-grok-plugins/
├── .grok-plugin/marketplace.json
├── plugins/
│   └── faf/          # Phase 1 — context
│       # fafm/       # Phase 2 — memory
│       # fafa/       # Phase 3 — agent
└── README.md
```

## Links

- Homepage: [faf.one](https://faf.one)
- MCP (Grok): [grok-faf-mcp](https://github.com/Wolfe-Jam/grok-faf-mcp) · `https://mcpaas.live/grok/mcp/v1`
- Claude marketplace (sibling): [faf-plugins](https://github.com/Wolfe-Jam/faf-plugins)

## License

MIT — Wolfe-Jam / FAF Foundation
