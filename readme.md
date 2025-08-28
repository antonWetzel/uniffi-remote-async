# Alias for an remote type as return in an async functions is buggy

## Issue

The Kotlin bindings fail to compile for this example

```rust
use core::Example;

uniffi::setup_scaffolding!();

// Setup the type alias
mod uniffi_setup {
    type InternalExample = core::Example;
    type ExternalExample = types::ExternalExample;
    uniffi::custom_type!(InternalExample, ExternalExample, { remote });
}

// Use the alias as the return value in an async method
#[uniffi::export]
pub async fn example() -> Example {
    Example { value: 0 }
}
```

## Rust Setup

- `types` (uniffi)
    - Define the rust type `ExternalExample` with uniffi
- `core` (rust only)
    - Define the rust only type `Example`, which is used in the code
    - Define the `Into` and `From` between `Example` and `ExternalExample`
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

Only types and consumer crates must be uniffi, the real logic can be split into multiple rust crates

## Ideas

1. Mark a kotlin package as the base package
    - Only the base package contains the `RustBuffer`, `...` glue
    - Other packages import the glue
