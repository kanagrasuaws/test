terraform {
 
  backend "s3" {
    bucket = "kubectlserver"
    region = "ap-south-1"
    key = "terraform.tfstate"
  }
}
