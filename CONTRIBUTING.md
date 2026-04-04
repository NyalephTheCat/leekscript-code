# Contributing to leekscript-vscode

This VS Code extension is part of the **parsing** workspace. It wraps **leekscript-lsp** and provides the editor UI (syntax, settings, commands, code lens).

## Workflow and conventions

- **General contributing:** See the root [CONTRIBUTING.md](../CONTRIBUTING.md) and [cursor.md](../cursor.md).
- **Where to edit what:** See [ARCHITECTURE.md](ARCHITECTURE.md).

## Extension-specific setup

From the **repository root** you can build the LSP and run tests; from the **leekscript-vscode** folder you build and run the extension:

```bash
# Build the extension (from leekscript-code/)
npm install && npm run compile && npx vsce package
```

Packaging **must** include `node_modules` (do not pass `vsce --no-dependencies`, and do not add `node_modules` to `.vscodeignore`). Otherwise activation fails with `Cannot find module 'vscode-languageclient/node'`.

- **F5** in VS Code (with `leekscript-code` as the opened folder) launches the Development Host with the extension loaded.
- Set `leekscript.server.path` to the path of your local `leekscript-lsp` binary (e.g. `../target/debug/leekscript-lsp` or an absolute path) to use the in-repo server.

When changing LSP behaviour (diagnostics, hover, go-to-definition, etc.), that code lives in **leekscript-lsp** (Rust), not in this extension. This repo only configures and launches the client.
