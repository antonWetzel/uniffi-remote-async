case "$(uname -s)" in
    Linux*)     SUFFIX="so";;
    Darwin*)    SUFFIX="dylib";;
    *)          SUFFIX="dll"
esac

DIR="demo/app/src/main/kotlin/org/example/bindings"
mkdir ${DIR}
cargo build
cargo run -- generate --library target/debug/libconsumer.${SUFFIX} --language kotlin --out-dir ${DIR}
cd demo
./gradlew build
cd ..
