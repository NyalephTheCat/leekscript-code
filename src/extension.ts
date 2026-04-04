import * as path from "path";
import {
  commands,
  ExtensionContext,
  Position,
  Selection,
  Uri,
  window,
  workspace,
} from "vscode";
import {
  Executable,
  LanguageClient,
  LanguageClientOptions,
} from "vscode-languageclient/node";

let client: LanguageClient | undefined;
let extensionPathForConfig = "";

function resolveSignatureEntry(rootFsPath: string | undefined, p: string): string {
  return path.isAbsolute(p) ? p : rootFsPath ? path.join(rootFsPath, p) : p;
}

function getLeekscriptConfig(extensionPath: string) {
  const config = workspace.getConfiguration("leekscript");
  const signatureFiles = config.get<string[]>("signatureFiles") ?? [];
  const rootUri = workspace.workspaceFolders?.[0]?.uri;
  const rootFs = rootUri?.fsPath;
  let resolved =
    signatureFiles.length > 0
      ? signatureFiles.map((p) => resolveSignatureEntry(rootFs, p))
      : [];
  const loadStdlibSignatures = config.get<boolean>("loadStdlibSignatures") ?? true;
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

  const sopts: Executable = {
    command: serverPath,
    args: [],
  };

  const copts: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "leekscript" }],
    initializationOptions: getLeekscriptConfig(extensionPathForConfig),
  };

  client = new LanguageClient("leekscript", "LeekScript", sopts, copts);
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
  const sopts: Executable = { command: serverPath, args: [] };
  const copts: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "leekscript" }],
    initializationOptions: getLeekscriptConfig(extensionPathForConfig),
  };
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
