module "uk-application" {

  source     = "../Application-module"
  app_region = "eu-west-2"
  bucket     = "tax-documents"
  ami        = "ami-078a289ddf4b09ae0"

}
