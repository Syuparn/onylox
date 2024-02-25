export type LoxResult = {
  code: number;
  stdout: string;
}

export async function runLox(source: string): Promise<LoxResult>{
  // HACK: import dynamically to avoid `ReferenceError: document is not defined`
  // https://docs.wasmer.io/javascript-sdk/explainers/troubleshooting#referenceerror-document-is-not-defined
  const { init, Wasmer } = await import("@wasmer/sdk");

  await init()
  const pkg = await Wasmer.fromRegistry('syuparn/onylox')
  const instance = await pkg.entrypoint?.run({
    args: ["/src/script.lox"],
    mount: {
      "/src": {
        "script.lox": source,
      },
    },
  })

  if (instance === undefined) {
    return {code: 1, stdout: "failed to get instance"}
  }

  const result = await instance.wait()

  return {code: result.code, stdout: result.stdout}
}
