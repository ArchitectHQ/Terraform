terraform {
  backend "s3" {
    bucket = "architecthq"
    key    = "terraform/state.tfstate"
    region = "ap-south-1"
  }
}
