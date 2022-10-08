module "main" {
  source       = "../.."
  description  = "${var.name} Server Profile."
  name         = var.name
  organization = "terratest"
}
