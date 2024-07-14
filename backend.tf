terraform {
  backend "s3" {
    bucket = "tfstate122"
    key = "terraform.tfstate"
    region = "eu-central-1"
  }
}
