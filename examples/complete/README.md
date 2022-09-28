<!-- BEGIN_TF_DOCS -->
# UCS Server Profile Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

### main.tf
```hcl
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
```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```
<!-- END_TF_DOCS -->