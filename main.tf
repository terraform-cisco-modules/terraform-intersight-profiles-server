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

data "intersight_compute_physical_summary" "server" {
  for_each = { for v in compact([var.serial_number]) : v => v }
  serial   = each.value
}

data "intersight_resourcepool_pool" "resource_pool" {
  for_each = {
    for v in compact([var.resource_pool]) : v => v if var.moids == false
  }
  name = each.value
}

data "intersight_server_profile_template" "template" {
  for_each = {
    for v in compact([var.server_template]) : v => v if length(
      regexall("[[:xdigit:]]{24}", var.server_template)
    ) == 0
  }
  name = each.value
}

data "intersight_uuidpool_pool" "uuid_pool" {
  for_each = {
    for v in compact([var.uuid_pool]) : v => v if var.moids == false
  }
  name = each.value
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
        ].moid : data.intersight_resourcepool_pool.resource_pool[
        associated_server_pool.value
      ].moid
      object_type = "resourcepool.Pool"
    }
  }
  dynamic "policy_bucket" {
    for_each = { for v in var.policy_bucket : v => v }
    content {
      moid        = policy_bucket.value.moid
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
      ].moid : data.intersight_uuidpool_pool.uuid_pool[uuid_pool.value].results[0].moid
      object_type = "uuidpool.Pool"
    }
  }
}
