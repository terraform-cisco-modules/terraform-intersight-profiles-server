#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  for_each = {
    for v in [var.organization] : v => v if var.moids == false
  }
  name = each.value
}

#____________________________________________________________
#
# Server Moid Data Source
# GUI Location:
#   Operate > Server > Copy the Serial from the Column.
#____________________________________________________________

data "intersight_adapter_config_policy" "adapter_configuration" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "adapter.ConfigPolicy"
  }
  name = each.value.name
}

data "intersight_bios_policy" "bios" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "bios.Policy"
  }
  name = each.value.name
}

data "intersight_boot_precision_policy" "boot_order" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "boot.PrecisionPolicy"
  }
  name = each.value.name
}

data "intersight_certificatemanagement_policy" "certificate_management" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "certificatemanagement.Policy"
  }
  name = each.value.name
}

data "intersight_compute_physical_summary" "server" {
  for_each = { for v in compact([var.serial_number]) : v => v }
  serial   = each.value
}

data "intersight_deviceconnector_policy" "device_connector" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "deviceconnector.Policy"
  }
  name = each.value.name
}

data "intersight_access_policy" "imc_access" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "access.Policy"
  }
  name = each.value.name
}

data "intersight_ipmioverlan_policy" "ipmi_over_lan" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "ipmioverlan.Policy"
  }
  name = each.value.name
}

data "intersight_vnic_lan_connectivity_policy" "lan_connectivity" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "vnic.LanConnectivityPolicy"
  }
  name = each.value.name
}

data "intersight_iam_ldap_policy" "ldap" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "iam.LdapPolicy"
  }
  name = each.value.name
}

data "intersight_iam_end_point_user_policy" "local_user" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "iam.EndPointUserPolicy"
  }
  name = each.value.name
}

data "intersight_networkconfig_policy" "network_connectivity" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "networkconfig.Policy"
  }
  name = each.value.name
}

data "intersight_ntp_policy" "ntp" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "ntp.Policy"
  }
  name = each.value.name
}

data "intersight_memory_persistent_memory_policy" "persistent_memory" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "memory.PersistentMemoryPolicy"
  }
  name = each.value.name
}

data "intersight_power_policy" "power" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "power.Policy"
  }
  name = each.value.name
}

data "intersight_resourcepool_pool" "resource_pool" {
  for_each = {
    for v in compact([var.resource_pool]) : v => v if var.moids == false
  }
  name = each.value
}

data "intersight_vnic_san_connectivity_policy" "san_connectivity" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "vnic.SanConnectivityPolicy"
  }
  name = each.value.name
}

data "intersight_sdcard_policy" "sd_card" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "sdcard.Policy"
  }
  name = each.value.name
}

data "intersight_server_profile_template" "template" {
  for_each = {
    for v in compact([var.server_template]) : v => v if length(
      regexall("[[:xdigit:]]{24}", var.server_template)
    ) == 0
  }
  name = each.value
}

data "intersight_sol_policy" "serial_over_lan" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "sol.Policy"
  }
  name = each.value.name
}

data "intersight_smtp_policy" "smtp" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "smtp.Policy"
  }
  name = each.value.name
}

data "intersight_snmp_policy" "snmp" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "snmp.Policy"
  }
  name = each.value.name
}

data "intersight_ssh_policy" "ssh" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "ssh.Policy"
  }
  name = each.value.name
}

data "intersight_storage_storage_policy" "storage" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "storage.StoragePolicy"
  }
  name = each.value.name
}

data "intersight_syslog_policy" "syslog" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "syslog.Policy"
  }
  name = each.value.name
}

data "intersight_kvm_policy" "virtual_kvm" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "kvm.Policy"
  }
  name = each.value.name
}

data "intersight_vmedia_policy" "virtual_media" {
  for_each = {
    for v in var.policy_bucket : v.name => v if var.moids == false && v.object_type == "vmedia.Policy"
  }
  name = each.value.name
}

data "intersight_uuidpool_pool" "uuid_pool" {
  for_each = {
    for v in compact([var.uuid_pool]) : v => v if var.moids == false
  }
  name = each.value
}

locals {
  org_moid = length(regexall(true, var.moids)
    ) > 0 ? var.organization : data.intersight_organization_organization.org_moid[
    var.organization].results[0
  ].moid
}

#____________________________________________________________
#
# Intersight UCS Server Profile Resource
# GUI Location: Profiles > UCS Server Profile > Create
#____________________________________________________________

resource "intersight_server_profile" "server" {
  depends_on = [
    data.intersight_compute_physical_summary.server,
    data.intersight_organization_organization.org_moid,
    data.intersight_resourcepool_pool.resource_pool,
    data.intersight_server_profile_template.template,
    data.intersight_uuidpool_pool.uuid_pool
  ]
  action      = var.action
  description = var.description != "" ? var.description : "${var.name} Server Profile."
  name        = var.name
  server_assignment_mode = length(compact(
    [var.resource_pool])) > 0 ? "Pool" : length(compact([var.serial_number])
  ) > 0 ? "Static" : "None"
  static_uuid_address = var.static_uuid_address
  target_platform     = var.target_platform
  type                = var.type
  uuid_address_type = length(
    compact([var.uuid_pool])
  ) > 0 ? "POOL" : length(compact([var.static_uuid_address])) > 0 ? "STATIC" : "NONE"
  wait_for_completion = var.wait_for_completion
  organization {
    moid = length(regexall(true, var.moids)
      ) > 0 ? var.organization : data.intersight_organization_organization.org_moid[
      var.organization].results[0
    ].moid
    object_type = "organization.Organization"
  }
  dynamic "assigned_server" {
    for_each = {
      for v in compact(
        [var.serial_number]
      ) : v => v if length(compact([var.resource_pool])) == 0
    }
    content {
      moid = data.intersight_compute_physical_summary.server[var.serial_number].results[0].moid
      object_type = data.intersight_compute_physical_summary.server[
        var.serial_number].results[0
      ].source_object_type
    }
  }
  dynamic "associated_server_pool" {
    for_each = { for v in compact([var.resource_pool]) : v => v }
    content {
      moid = length(regexall(true, var.moids)
        ) > 0 ? var.pools.resource_pool[associated_server_pool.value
        ].moid : [for i in data.intersight_resourcepool_pool.resource_pool[associated_server_pool.value
        ].results : i.moid if i.organization[0].moid == local.org_moid
      ][0]
      object_type = "resourcepool.Pool"
    }
  }
  dynamic "policy_bucket" {
    for_each = { for v in var.policy_bucket : v.object_type => v }
    content {
      moid = length(regexall(true, var.moids)
        ) > 0 ? var.policies[policy_bucket.value.policy][policy_bucket.value.name
        ] : length(regexall("adapter.ConfigPolicy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_adapter_config_policy.adapter_configuration[
          policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("bios.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_bios_policy.bios[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("boot.PrecisionPolicy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_boot_precision_policy.boot_order[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("certificatemanagement.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_certificatemanagement_policy.certificate_management[
          policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("deviceconnector.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_deviceconnector_policy.device_connector[
          policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("access.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_access_policy.imc_access[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("ipmioverlan.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_ipmioverlan_policy.ipmi_over_lan[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("vnic.LanConnectivityPolicy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_vnic_lan_connectivity_policy.lan_connectivity[
          policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("iam.LdapPolicy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_iam_ldap_policy.ldap[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("iam.EndPointUserPolicy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_iam_end_point_user_policy.local_user[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("networkconfig.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_networkconfig_policy.network_connectivity[
          policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("ntp.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_ntp_policy.ntp[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("memory.PersistentMemoryPolicy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_memory_persistent_memory_policy.persistent_memory[
          policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("power.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_power_policy.power[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("vnic.SanConnectivityPolicy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_vnic_san_connectivity_policy.san_connectivity[
          policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("sdcard.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_sdcard_policy.sd_card[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("sol.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_sol_policy.serial_over_lan[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("smtp.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_smtp_policy.smtp[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("snmp.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_snmp_policy.snmp[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("ssh.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_ssh_policy.ssh[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("storage.StoragePolicy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_storage_storage_policy.storage[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("syslog.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_syslog_policy.syslog[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("kvm.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_kvm_policy.virtual_kvm[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
        ][0] : length(regexall("vmedia.Policy", policy_bucket.value.object_type)
        ) > 0 ? [for i in data.intersight_vmedia_policy.virtual_media[policy_bucket.value.name
        ].results : i.moid if i.organization[0].moid == local.org_moid
      ][0] : ""
      object_type = policy_bucket.value.object_type
    }
  }
  dynamic "src_template" {
    for_each = { for v in compact([var.server_template]) : v => v }
    content {
      moid = length(
        regexall("[[:xdigit:]]{24}", var.server_template)
        ) > 0 ? var.server_template : data.intersight_server_profile_template.template[
        src_template.value].results[0
      ].moid
    }
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
  dynamic "uuid_pool" {
    for_each = { for v in compact([var.uuid_pool]) : v => v }
    content {
      moid = length(regexall(true, var.moids)
        ) > 0 ? var.pools.uuid[uuid_pool.value
        ].moid : [for i in data.intersight_uuidpool_pool.uuid_pool[uuid_pool.value
        ].results : i.moid if i.organization[0].moid == local.org_moid
      ][0]
      object_type = "uuidpool.Pool"
    }
  }
}
