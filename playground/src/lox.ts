let wasmMemory: ArrayBufferLike;

const importObject = {
  host: {
    print_str: (ptr: number, len: number) => {
      const arr = new Uint8Array(wasmMemory, ptr, len)
      const out = new TextDecoder().decode(arr)
    },
    time: () => {
      return Date.now();
    },
  },
  js: {
    mem: new WebAssembly.Memory({ initial: 10, maximum: 100 }),
  },
}

export async function initLox(): Promise<(source: any) => void>{
  const response = await fetch('/onylox.wasm')
  const buffer = await response.arrayBuffer()
  const datasource = await WebAssembly.instantiate(buffer, importObject);
  
  // set memory
  wasmMemory = datasource.instance.exports.memory as unknown as ArrayBufferLike

  return datasource.instance.exports.runLox as (source: any) => void
}
