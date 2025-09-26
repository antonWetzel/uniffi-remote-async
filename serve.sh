npx yarn install
npx yarn ubrn build web
npx esbuild src/main.ts --bundle --outfile=out/bundle.js --format=esm --target=esnext --platform=browser --loader:.wasm=file
cp index.html out/index.html
basic-http-server out
