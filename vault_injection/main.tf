
variable "apps" {
  description = "App configuration from any source"
  type = map(object({
    color    = string
    sound    = string
    language = string
    # nested object to be closer to the real problem
    secret_config = object({
      attribute = string
    })
  }))
}

# requires that the secrets are stored in a place that can be found by app_name
# but it would also be possible to add "path" to secrets config and then use each.value.secret_config-path below
data "vault_generic_secret" "app_secrets" {
  for_each = var.apps
  path     = "secret/apps/${each.key}"
}

# requires some magic if the secret should be injected in a nested object ...
# if you just want to inject at the top level object it's only one merge.
locals {
  apps = { for k, v in var.apps : k => merge(
    v,
    {
      secret_config = merge(
        v.secret_config,
        {
          secret_value = data.vault_generic_secret.app_secrets[k].data.app_secret
        }
      )
    }

    )
  }
}

module "app_config" {
  source = "./modules/app_config"

  for_each = local.apps
  app_name = each.key

  color    = each.value.color
  sound    = each.value.sound
  language = each.value.language

  app_password = each.value.secret_config.secret_value

}
