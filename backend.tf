terraform {
  backend "gcs" {
    bucket = "dora-bucket1"
    prefix = "test/state"
  }
}
