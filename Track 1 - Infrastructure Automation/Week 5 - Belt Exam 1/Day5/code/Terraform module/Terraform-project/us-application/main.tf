module "us-application" {

  source     = "../Application-module"
  app_region = "us-east-1"
  bucket     = "tax-documents"
  ami        = "ami-083602cee93914c0c"

}
