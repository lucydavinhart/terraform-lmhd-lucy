data "http" "lucy" {
  url = "https://api.lmhd.me/v1/name.json"
}

locals {
  lucy = jsondecode(data.http.lucy.body)
}

/*
output "raw_name" {
  value = local.lucy
}
*/

output "full_name" {
  value = local.lucy.full_name.preferred
}

output "initials" {
  value = local.lucy.initials.preferred
}

output "version" {
  value = local.lucy.version
}

output "first_name" {
  value = local.lucy.first_name.preferred
}

output "family_name" {
  value = local.lucy.family_name.preferred
}

locals {
  middles = [
    for name in local.lucy.middle_names :
    name.preferred
  ]
}

output "middle_names" {
  value = local.middles
}
