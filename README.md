# faf-grok-plugins

**Canonical FAF ecosystem plugins for [Grok Build](https://x.ai).**

One marketplace. Install only what you need. Cascade the rest without new repos.

| Plugin | Layer | Format | Status |
|--------|--------|--------|--------|
| **faf** | Context | `.faf` | **v1.1.0** — live |
| **fafm** | Memory | `.fafm` | later → `plugins/fafm/` |
| **fafa** | Agent | `.fafa` | later → `plugins/fafa/` |

## Install

```bash
# 1. Add the marketplace (once)
grok plugin marketplace add Wolfe-Jam/faf-grok-plugins

# 2. Install the context plugin
grok plugin install faf --trust
```

If Claude’s `faf-plugins` marketplace is also added (both ship a plugin named `faf`), **pin the Grok marketplace**:

```bash
grok plugin install faf@wolfe-jam/faf-grok-plugins --trust
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

## Citation

Context plugin lives on the `.faf` paper. The `.fafa` plugin (later) is specified by the Agents paper — who the agent is, in the agentic era.

> Wolfe, J. (2025). *Format-Driven AI Context Architecture: The .faf Standard for Persistent Project Understanding*. Zenodo. https://doi.org/10.5281/zenodo.18251362

> Wolfe, J. (2026). *Why Agents Need a Passport: .fafa — Portable Identity for the Agentic Era*. Zenodo. https://doi.org/10.5281/zenodo.21951641

## License

MIT — Wolfe-Jam / FAF Foundation
