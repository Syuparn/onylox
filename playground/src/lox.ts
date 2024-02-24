import { init, Wasmer } from "@wasmer/sdk";

export type LoxResult = {
  code: number;
  stdout: string;
}

export async function runLox(source: string): Promise<LoxResult>{
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
