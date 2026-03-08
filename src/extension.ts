import * as path from "path";
import {
  workspace,
  window,
  ExtensionContext,
  commands,
  Uri,
  Position,
  Selection,
} from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
} from "vscode-languageclient/node";

let client: LanguageClient | undefined;
let serverOptions: ServerOptions | undefined;
let clientOptions: LanguageClientOptions | undefined;
let extensionPathForConfig: string = "";

function getLeekscriptConfig(extensionPath: string) {
  const config = workspace.getConfiguration("leekscript");
  const signatureFiles = config.get<string[]>("signatureFiles") ?? [];
  const rootUri = workspace.workspaceFolders?.[0]?.uri;
  let resolved: string[] =
    rootUri && signatureFiles.length > 0
      ? signatureFiles.map((p) => path.join(rootUri.fsPath, p))
      : signatureFiles;
  const loadStdlibSignatures =
    config.get<boolean>("loadStdlibSignatures") ?? true;
  // When stdlib loading is enabled and no custom paths are set, pass the extension's bundled signatures dir so the LSP can load built-in API definitions.
  if (loadStdlibSignatures && resolved.length === 0 && extensionPath) {
    resolved = [path.join(extensionPath, "signatures")];
  }
  const inlayHintsEnabled = config.get<boolean>("inlayHints.enabled") ?? true;
  const codeLensReferences = config.get<boolean>("codeLens.references") ?? true;
  return {
    loadStdlibSignatures,
    signatureFiles: resolved,
    inlayHints: { enabled: inlayHintsEnabled },
    codeLens: { references: codeLensReferences },
  };
}

export async function activate(context: ExtensionContext): Promise<void> {
  extensionPathForConfig = context.extensionPath;
  const config = workspace.getConfiguration("leekscript");
  const serverPath = config.get<string>("server.path") ?? "leekscript-lsp";

  const sopts: ServerOptions = {
    command: serverPath,
    args: [],
  };

  const copts: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "leekscript" }],
    initializationOptions: getLeekscriptConfig(extensionPathForConfig),
  };

  serverOptions = sopts;
  clientOptions = copts;

  client = new LanguageClient(
    "leekscript",
    "LeekScript",
    sopts,
    copts
  );

  await client.start();

  context.subscriptions.push(
    commands.registerCommand("leekscript.restart", async () => {
      await restartServer();
    })
  );

  context.subscriptions.push(
    commands.registerCommand(
      "leekscript.showReferences",
      async (uriStr: string, position: { line: number; character: number }) => {
        const uri = Uri.parse(uriStr);
        const doc = await workspace.openTextDocument(uri);
        const editor = await window.showTextDocument(doc);
        const pos = new Position(position.line, position.character);
        editor.selection = new Selection(pos, pos);
        editor.revealRange(editor.selection);
        await commands.executeCommand("editor.action.referenceSearch.trigger");
      }
    )
  );
}

async function restartServer(): Promise<void> {
  const config = workspace.getConfiguration("leekscript");
  const serverPath = config.get<string>("server.path") ?? "leekscript-lsp";
  const sopts: ServerOptions = { command: serverPath, args: [] };
  const copts: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "leekscript" }],
    initializationOptions: getLeekscriptConfig(extensionPathForConfig),
  };
  serverOptions = sopts;
  clientOptions = copts;
  if (client) {
    await client.stop();
    client = undefined;
  }
  client = new LanguageClient("leekscript", "LeekScript", sopts, copts);
  await client.start();
}

export async function deactivate(): Promise<void> {
  await client?.stop();
  client = undefined;
}
