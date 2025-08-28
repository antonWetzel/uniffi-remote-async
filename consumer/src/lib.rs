use core::Example;

uniffi::setup_scaffolding!();

mod uniffi_setup {
    type InternalExample = core::Example;
    type ExternalExample = types::ExternalExample;
    uniffi::custom_type!(InternalExample, ExternalExample, { remote });
}

#[uniffi::export]
pub async fn example() -> Example {
    Example { value: 0 }
}
