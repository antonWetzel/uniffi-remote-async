npx yarn install
npx yarn ubrn build web
# https://github.com/jhugman/uniffi-bindgen-react-native/issues/306
grep -rl --include='*.ts' 'async public' . | xargs sed -i '' 's/async public/public async/g'
npx esbuild src/main.ts --bundle --outfile=out/bundle.js --format=esm --target=esnext --platform=browser --loader:.wasm=file
cp index.html out/index.html
basic-http-server out
