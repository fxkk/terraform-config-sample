locals {
  bottom_up_apps    = yamldecode(file("${path.module}/apps.yml"))
  bottom_up_clouds  = distinct([for app in local.bottom_up_apps : app.cloud])
  bottom_up_regions = distinct([for app in local.bottom_up_apps : app.region])
  bottom_up_teams   = distinct([for app in local.bottom_up_apps : app.team])
  bottom_up = { for cloud in local.bottom_up_clouds : cloud => {
    for region in local.bottom_up_regions : region => {
      for team in local.bottom_up_teams : team => {
        for app in local.bottom_up_apps : app.name => {
          param1 = app.param1
          param2 = app.param2
        }
        if app.cloud == cloud && app.region == region && app.team == team
      }
      if length([for app in local.bottom_up_apps : app if app.cloud == cloud && app.team == team && app.region == region]) != 0
    }
    if length([for app in local.bottom_up_apps : app if app.cloud == cloud && app.region == region]) != 0
  } }
}