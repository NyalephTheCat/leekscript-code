# LeekScript for VS Code

Language support for [LeekScript](https://leekscript.com) in Visual Studio Code: syntax highlighting, diagnostics, hover (inferred types), go to definition, find references, and more via the **leekscript-lsp** language server.

This extension is part of the **parsing** workspace. Build and run from the repo root for the full stack; see [CONTRIBUTING.md](CONTRIBUTING.md) and [ARCHITECTURE.md](ARCHITECTURE.md) for where to edit what.

## Requirements

- **leekscript-lsp** available in your `$PATH` or specified in a parameter. You can download it here:

```bash
cargo install leekscript-lsp
```

## Installation

### Option A: Install from VSIX

1. Build the VSIX (from the `leekscript-code` folder):
   ```bash
   npm install && npm run compile && npx vsce package
   ```
   Do **not** use `vsce package --no-dependencies`: the extension needs `vscode-languageclient` shipped inside the VSIX (see `.vscodeignore`). This creates `leekscript-lsp-0.1.0.vsix` (version from `package.json`).

2. In VS Code:
   - Press **Ctrl+Shift+P** (Mac: **Cmd+Shift+P**) to open the Command Palette.
   - Run **“Extensions: Install from VSIX…”**.
   - Choose the generated `.vsix` file.
   - Reload the window if prompted.

   Alternatively, drag the `.vsix` onto the Extensions sidebar.

### Option B: Run from source (development)

1. Open the extension folder: `File > Open Folder` → select `leekscript-code`.
2. Press **F5** to launch a new window with the extension loaded (Development Host).
3. Open a `.leek` file to activate; you should get diagnostics and hover if the LSP is running.

## Settings

| Setting | Description | Default |
|--------|-------------|---------|
| `leekscript.server.path` | Path to the `leekscript-lsp` executable. Use a full path if the binary is not on PATH. | `leekscript-lsp` |
| `leekscript.loadStdlibSignatures` | Load the bundled standard library `.sig` files so built-in functions and constants are recognized (completion, hover, diagnostics). | `true` |
| `leekscript.signatureFiles` | Additional paths to `.sig` files (e.g. custom API definitions). Paths are resolved relative to the workspace root. | `[]` |
| `leekscript.inlayHints.enabled` | Show inlay hints for variable types (e.g. ": integer"). Requires **Editor: Inlay Hints** to be on. | `true` |
| `leekscript.inlayHints.hideAny` | Hide low-signal inferred type hints that are just ": any". | `false` |
| `leekscript.codeLens.references` | Show “N references” code lens above functions, classes, and methods. Requires **Editor: Code Lens** to be enabled. | `true` |

For local development, set a full path for the server, for example:

```json
{
  "leekscript.server.path": "/path/to/parsing/target/debug/leekscript-lsp"
}
```

## Features

- **Syntax highlighting** for `.leek` files (keywords, strings, numbers, comments).
- **Diagnostics** from the language server (parse errors, type errors, deprecations).
- **Hover** showing inferred types for expressions and variables.
- **Go to Definition** (F12): jump to the definition of variables, functions, and classes.
- **Find References** (Shift+F12): list all references to the symbol under the cursor.
- **Code Lens**: reference count above functions, classes, and methods (e.g. “3 references”); click to run Find All References. Enable with `leekscript.codeLens.references` and ensure **Editor: Code Lens** is on.

## Development

From the `leekscript-code` folder:

```bash
npm install && npm run compile && npx vsce package
```

Press **F5** in VS Code to launch the extension in a Development Host. See [CONTRIBUTING.md](CONTRIBUTING.md) for extension-specific setup and the root [CONTRIBUTING.md](../CONTRIBUTING.md) and [cursor.md](../cursor.md) for workspace conventions.

## License

Same as the leekscript-rs / leekscript-lsp project.
