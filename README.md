# LeekScript for VS Code

Language support for [LeekScript](https://leekscript.com) in Visual Studio Code: syntax highlighting, diagnostics, hover (inferred types), go to definition, find references, and more via the **leekscript-lsp** language server.

## Requirements

- **leekscript-lsp** must be built and available on your `PATH`, or you must set its path in settings.

Build the LSP from the parsing workspace:

```bash
cd /path/to/parsing
cargo build -p leekscript-lsp
# Ensure target/debug/leekscript-lsp (or release) is on PATH, or set leekscript.server.path
```

## Installation

### Option A: Install from VSIX

1. Build the VSIX (from the `leekscript-vscode` folder):
   ```bash
   npm install && npm run compile && npx vsce package --no-dependencies
   ```
   This creates `leekscript-0.1.0.vsix`.

2. In VS Code:
   - Press **Ctrl+Shift+P** (Mac: **Cmd+Shift+P**) to open the Command Palette.
   - Run **“Extensions: Install from VSIX…”**.
   - Choose the `leekscript-0.1.0.vsix` file.
   - Reload the window if prompted.

   Alternatively, drag `leekscript-0.1.0.vsix` onto the Extensions sidebar.

### Option B: Run from source (development)

1. Open the extension folder: `File > Open Folder` → select `leekscript-vscode`.
2. Press **F5** to launch a new window with the extension loaded (Development Host).
3. Open a `.leek` file to activate; you should get diagnostics and hover if the LSP is running.

## Settings

| Setting | Description | Default |
|--------|-------------|---------|
| `leekscript.server.path` | Path to the `leekscript-lsp` executable. | `leekscript-lsp` (must be on PATH) |

For local development, set a full path, for example:

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

## License

Same as the leekscript-rs / leekscript-lsp project.
