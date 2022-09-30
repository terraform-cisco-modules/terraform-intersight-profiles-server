<!-- BEGIN_TF_DOCS -->
# Terraform Intersight Profiles - UCS Server
Manages Intersight UCS Server Profiles

Location in GUI:
`Profiles` » `UCS Server Profiles` » `Create UCS Server Profile`

## Example

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

### Environment Variables

Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable secretkey with value of [your-secret-file-content]

Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_secretkey="<secret-key-file-location>"
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.32 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.32 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_action"></a> [action](#input\_action) | Action to Perform on the Chassis Profile Assignment.  Options are:<br>* Deploy<br>* No-op<br>* Unassign | `string` | `"No-op"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the Profile. | `string` | `""` | no |
| <a name="input_moids"></a> [moids](#input\_moids) | Flag to Determine if pools and policies should be data sources or if they already defined as a moid. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the Profile. | `string` | `"default"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"default"` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | Map for Moid based Policy Sources. | `any` | `{}` | no |
| <a name="input_policy_bucket"></a> [policy\_bucket](#input\_policy\_bucket) | List of Policies to Assign to the Profile. | <pre>list(object(<br>    {<br>      name        = string<br>      object_type = string<br>      policy      = optional(string)<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_pools"></a> [pools](#input\_pools) | Map for Moid based Pool Sources. | `any` | `{}` | no |
| <a name="input_resource_pool"></a> [resource\_pool](#input\_resource\_pool) | Name of the Server Resource Pool to assign to the Policy. | `string` | `""` | no |
| <a name="input_serial_number"></a> [serial\_number](#input\_serial\_number) | Serial Number of the Chassis to Assign. | `string` | `""` | no |
| <a name="input_server_template"></a> [server\_template](#input\_server\_template) | The Name of the Server Template to Assign to the Server. | `string` | `""` | no |
| <a name="input_static_uuid_address"></a> [static\_uuid\_address](#input\_static\_uuid\_address) | The UUID address for the server must include UUID prefix xxxxxxxx-xxxx-xxxx along with the UUID suffix of format xxxx-xxxxxxxxxxxx.  Joined with a '=' | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag Attributes to Assign to the Policy. | `list(map(string))` | `[]` | no |
| <a name="input_target_platform"></a> [target\_platform](#input\_target\_platform) | The platform for which the chassis profile is applicable. It can either be a chassis that is operating in standalone mode or which is attached to a Fabric Interconnect managed by Intersight.<br>* FIAttached - Chassis which are connected to a Fabric Interconnect that is managed by Intersight. | `string` | `"FIAttached"` | no |
| <a name="input_type"></a> [type](#input\_type) | Defines the type of the profile. Accepted values are:<br>* instance<br>* template | `string` | `"instance"` | no |
| <a name="input_uuid_pool"></a> [uuid\_pool](#input\_uuid\_pool) | Name of a UUID Pool to Assign to the Policy. | `string` | `""` | no |
| <a name="input_wait_for_completion"></a> [wait\_for\_completion](#input\_wait\_for\_completion) | This model object can trigger workflows. Use this option to wait for all running workflows to reach a complete state. | `bool` | `false` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | UCS Server Profile Managed Object ID (moid). |
## Resources

| Name | Type |
|------|------|
| [intersight_server_profile.server](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/server_profile) | resource |
| [intersight_access_policy.imc_access](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/access_policy) | data source |
| [intersight_adapter_config_policy.adapter_configuration](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/adapter_config_policy) | data source |
| [intersight_bios_policy.bios](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/bios_policy) | data source |
| [intersight_boot_precision_policy.boot_order](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/boot_precision_policy) | data source |
| [intersight_certificatemanagement_policy.certificate_management](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/certificatemanagement_policy) | data source |
| [intersight_compute_physical_summary.server](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/compute_physical_summary) | data source |
| [intersight_deviceconnector_policy.device_connector](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/deviceconnector_policy) | data source |
| [intersight_iam_end_point_user_policy.local_user](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/iam_end_point_user_policy) | data source |
| [intersight_iam_ldap_policy.ldap](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/iam_ldap_policy) | data source |
| [intersight_ipmioverlan_policy.ipmi_over_lan](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/ipmioverlan_policy) | data source |
| [intersight_kvm_policy.virtual_kvm](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/kvm_policy) | data source |
| [intersight_memory_persistent_memory_policy.persistent_memory](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/memory_persistent_memory_policy) | data source |
| [intersight_networkconfig_policy.network_connectivity](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/networkconfig_policy) | data source |
| [intersight_ntp_policy.ntp](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/ntp_policy) | data source |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
| [intersight_power_policy.power](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/power_policy) | data source |
| [intersight_resourcepool_pool.resource_pool](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/resourcepool_pool) | data source |
| [intersight_sdcard_policy.sd_card](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/sdcard_policy) | data source |
| [intersight_server_profile_template.template](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/server_profile_template) | data source |
| [intersight_smtp_policy.smtp](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/smtp_policy) | data source |
| [intersight_snmp_policy.snmp](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/snmp_policy) | data source |
| [intersight_sol_policy.serial_over_lan](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/sol_policy) | data source |
| [intersight_ssh_policy.ssh](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/ssh_policy) | data source |
| [intersight_storage_storage_policy.storage](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/storage_storage_policy) | data source |
| [intersight_syslog_policy.syslog](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/syslog_policy) | data source |
| [intersight_uuidpool_pool.uuid_pool](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/uuidpool_pool) | data source |
| [intersight_vmedia_policy.virtual_media](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/vmedia_policy) | data source |
| [intersight_vnic_lan_connectivity_policy.lan_connectivity](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/vnic_lan_connectivity_policy) | data source |
| [intersight_vnic_san_connectivity_policy.san_connectivity](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/vnic_san_connectivity_policy) | data source |
<!-- END_TF_DOCS -->