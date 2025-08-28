use types::ExternalExample;

pub struct Example {
    pub value: i32,
}

impl From<ExternalExample> for Example {
    fn from(value: ExternalExample) -> Self {
        Self { value: value.value }
    }
}

impl From<Example> for ExternalExample {
    fn from(value: Example) -> Self {
        Self { value: value.value }
    }
}
