#____________________________________________________________
#
# Collect the moid of the UCS Server Profile
#____________________________________________________________

output "moid" {
  description = "UCS Server Profile Managed Object ID (moid)."
  value       = intersight_server_profile.server.moid
}
