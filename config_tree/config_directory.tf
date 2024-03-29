locals {
  config_dir_app_files = fileset("${path.module}/config", "**/*.yaml")
  config_dir_clouds    = distinct([for f in local.config_dir_app_files : split("/", f)[0]])
  config_dir_regions   = distinct([for f in local.config_dir_app_files : split("/", f)[1] if !endswith(f, "cloud.yaml")])
  config_dir_teams     = distinct([for f in local.config_dir_app_files : split("/", f)[2] if !endswith(f, "cloud.yaml")])
  config_dir = { for cloud in local.config_dir_clouds : cloud => merge(
    yamldecode(file("${path.module}/config/${cloud}/cloud.yaml")),
    {
    regions = {
      for region in local.config_dir_regions : region => {
        for team in local.config_dir_teams : team => {
          for app in local.config_dir_app_files : trimsuffix(split("/", app)[3], ".yaml") =>
          yamldecode(file("${path.module}/config/${app}"))
          if startswith(app, "${cloud}/${region}/${team}")
        }
        if length([for app in local.config_dir_app_files : app if startswith(app, "${cloud}/${region}/${team}")]) != 0
      }
      if length([for app in local.config_dir_app_files : app if startswith(app, "${cloud}/${region}")]) != 0
    }
    })
  }
}