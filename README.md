# LeekScript for VS Code

Language support for [LeekScript](https://leekscript.com) in Visual Studio Code: syntax highlighting, diagnostics, hover (inferred types), go to definition, find references, and more via the **leekscript-lsp** language server.

## Requirements

- **leekscript-lsp** available in your `$PATH` or specified in a parameter. You can download it here:

```bash
cargo install leekscript-lsp
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
| `leekscript.codeLens.references` | Show “N references” code lens above functions, classes, and methods. | `true` |

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
- **Code Lens**: reference count above functions, classes, and methods (e.g. “3 references”); click to run Find All References. Enable with `leekscript.codeLens.references` and ensure **Editor: Code Lens** is on.

## License

Same as the leekscript-rs / leekscript-lsp project.
