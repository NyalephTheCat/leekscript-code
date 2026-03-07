import * as path from "path";
import { workspace, ExtensionContext, commands } from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
} from "vscode-languageclient/node";

let client: LanguageClient | undefined;
let serverOptions: ServerOptions | undefined;
let clientOptions: LanguageClientOptions | undefined;

function getLeekscriptConfig() {
  const config = workspace.getConfiguration("leekscript");
  const signatureFiles = config.get<string[]>("signatureFiles") ?? [];
  const rootUri = workspace.workspaceFolders?.[0]?.uri;
  const resolved =
    rootUri && signatureFiles.length > 0
      ? signatureFiles.map((p) => path.join(rootUri.fsPath, p))
      : signatureFiles;
  const inlayHintsEnabled = config.get<boolean>("inlayHints.enabled") ?? true;
  return {
    loadStdlibSignatures: config.get<boolean>("loadStdlibSignatures") ?? true,
    signatureFiles: resolved,
    inlayHints: { enabled: inlayHintsEnabled },
  };
}

export async function activate(context: ExtensionContext): Promise<void> {
  const config = workspace.getConfiguration("leekscript");
  const serverPath = config.get<string>("server.path") ?? "leekscript-lsp";

  const sopts: ServerOptions = {
    command: serverPath,
    args: [],
  };

  const copts: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "leekscript" }],
    initializationOptions: getLeekscriptConfig(),
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
}

async function restartServer(): Promise<void> {
  const config = workspace.getConfiguration("leekscript");
  const serverPath = config.get<string>("server.path") ?? "leekscript-lsp";
  const sopts: ServerOptions = { command: serverPath, args: [] };
  const copts: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "leekscript" }],
    initializationOptions: getLeekscriptConfig(),
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
