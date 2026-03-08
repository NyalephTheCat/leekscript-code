# leekscript-vscode architecture

This document describes the extension layout and where to change things.

## Overview

The extension is a **VS Code client** that starts **leekscript-lsp** (the Rust language server) and forwards LSP requests. All language intelligence (parsing, analysis, diagnostics, hover, go-to-definition, etc.) is implemented in leekscript-lsp; this repo only configures the client, registers commands, and exposes settings.

## Project layout

| Path | Role |
|------|------|
| **package.json** | Extension manifest: activation events, commands, configuration schema, language id, grammar and language-configuration references. |
| **src/extension.ts** | Entry point: `activate` starts the LanguageClient with `server.path` and `initializationOptions` (signature files, inlay hints, code lens). Registers `leekscript.restart` and `leekscript.showReferences`. |
| **syntaxes/leekscript.tmLanguage.json** | TextMate grammar for syntax highlighting (fallback when LSP semantic tokens are off or for initial colouring). |
| **language-configuration.json** | Editor behaviour: comment style, brackets, auto-closing pairs. |
| **signatures/** | Bundled `.sig` files for the standard library; passed to the LSP via `initializationOptions` when `loadStdlibSignatures` is true. |

## Where to change what

| Goal | Where to work |
|------|----------------|
| **New setting** | `package.json` → `contributes.configuration.properties`; read in `src/extension.ts` and pass in `initializationOptions` if the LSP needs it. |
| **New command** | `package.json` → `contributes.commands`; implement in `src/extension.ts` with `commands.registerCommand`. |
| **Change how the LSP is started** | `src/extension.ts`: `ServerOptions`, `LanguageClientOptions`, `getLeekscriptConfig`. |
| **Syntax highlighting (TextMate)** | `syntaxes/leekscript.tmLanguage.json`. For semantic highlighting, the LSP drives it; changes go in **leekscript-lsp**. |
| **Comment/bracket behaviour** | `language-configuration.json`. |
| **Bundled signatures** | Add or update files under `signatures/`; ensure `getLeekscriptConfig` passes the path to the LSP when `loadStdlibSignatures` is true. |

## LSP vs extension

- **In this repo:** Client wiring, settings UI, commands, grammar and language config.
- **In leekscript-lsp:** All language features (diagnostics, hover, completion, go-to-definition, semantic tokens, code actions, etc.). Change those in the Rust crate, not here.
