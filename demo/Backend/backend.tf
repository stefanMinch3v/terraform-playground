terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "some-remote-backend-2024"
        region = "eu-west-2"
        access_key = "your_access_key" # get from aws cli
        secret_key = "your_secret_key" # get from aws cli
    }
}
# so we keep the state of terraform in s3 bucket