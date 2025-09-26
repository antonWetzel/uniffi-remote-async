import * as bindings from "./generated/bindings"

export async function run() {
  await bindings.uniffiInitAsync()

  let factory = new bindings.Factory()
  let product = await factory.createProduct()
  console.log(product)
}
