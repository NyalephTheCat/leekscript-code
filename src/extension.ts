import * as path from "path";
import { workspace, ExtensionContext } from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
} from "vscode-languageclient/node";

let client: LanguageClient | undefined;

function getLeekscriptConfig() {
  const config = workspace.getConfiguration("leekscript");
  const signatureFiles = config.get<string[]>("signatureFiles") ?? [];
  const rootUri = workspace.workspaceFolders?.[0]?.uri;
  const resolved =
    rootUri && signatureFiles.length > 0
      ? signatureFiles.map((p) => path.join(rootUri.fsPath, p))
      : signatureFiles;
  return {
    loadStdlibSignatures: config.get<boolean>("loadStdlibSignatures") ?? true,
    signatureFiles: resolved,
  };
}

export async function activate(context: ExtensionContext): Promise<void> {
  const config = workspace.getConfiguration("leekscript");
  const serverPath = config.get<string>("server.path") ?? "leekscript-lsp";

  const serverOptions: ServerOptions = {
    command: serverPath,
    args: [],
  };

  const clientOptions: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "leekscript" }],
    initializationOptions: getLeekscriptConfig(),
  };

  client = new LanguageClient(
    "leekscript",
    "LeekScript",
    serverOptions,
    clientOptions
  );

  await client.start();
}

export async function deactivate(): Promise<void> {
  await client?.stop();
  client = undefined;
}
