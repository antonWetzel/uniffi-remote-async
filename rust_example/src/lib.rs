// You must call this once
uniffi::setup_scaffolding!();

#[derive(Debug, uniffi::Object)]
pub struct Factory {}

#[uniffi::export]
impl Factory {
    #[uniffi::constructor]
    pub fn new() -> Self {
        Self {}
    }

    pub async fn create_product(&self) -> Product {
        Product {}
    }
}

#[derive(Debug, uniffi::Object)]
pub struct Product {}
