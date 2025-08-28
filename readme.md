# Alias for an remote type as return in an async functions is buggy

## Rust Setup

- `types` (uniffi)
    - Define the rust type `ExternalExample` with uniffi as alias type
- `core` (rust only)
    - Define the rust only type `Example`, which is used in the code
    - Define the `Into` and `From` for `Example` and `ExternalExample`
- `consumer` (uniffi)
    - Define the custom type for Kotlin `ExternalExample` and rust `Example`
    - Define uniffi method `async example() -> Example`

## Result

1. Rust compiles
1. Bindings are created
1. **ERROR:** Bindings don't compile

```
.../bindings/uniffi/consumer/consumer.kt:1256:48
Argument type mismatch: actual type is 'uniffi.consumer.RustBuffer.ByValue',
but 'uniffi.types.RustBuffer.ByValue' was expected.
```

## Why this setup

Only types and consumer must be uniffi, the real logic can be split into multiple rust crates

## Ideas

1. Mark a kotlin package as the base package
    - Only the base package contains the `RustBuffer`, `...` glue
    - Other packages import the glue
