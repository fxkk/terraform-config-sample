terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
  }
}

variable "app_name" {
  type = string
}

variable "color" {
  type = string
}

variable "sound" {
  type = string
}

variable "language" {
  type = string
}

variable "app_password" {
  type = string
}

resource "local_file" "foo" {
  content  = <<EOT
[config]
color=${var.color}
sound=${var.sound}
language=${var.language}

[secrets]
password=${var.app_password}
EOT
  filename = "${path.root}/out/${var.app_name}.txt"
}