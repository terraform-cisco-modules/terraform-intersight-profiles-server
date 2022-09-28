module "server" {
  source  = "terraform-cisco-modules/profiles-server/intersight"
  version = ">= 1.0.1"

  action              = "No-Op"
  description         = "default Server Profile."
  name                = "default"
  organization        = "default"
  serial_number       = "FO1324556"
  target_platform     = "FIAttached"
  uuid_pool           = "default"
  wait_for_completion = false
}
