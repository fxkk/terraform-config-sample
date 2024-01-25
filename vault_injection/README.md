# Terraform and Vault Example


## Setup

```bash
source init.sh

terraform init
```

## Example

```bash
$ echo "local.apps" | tf console
{
  "a" = {
    "color" = "Blue"
    "language" = "English"
    "secret_config" = {
      "attribute" = "value_a"
      "secret_value" = (sensitive value)
    }
    "sound" = "Chime"
  }
  "b" = {
    "color" = "Green"
    "language" = "Spanish"
    "secret_config" = {
      "attribute" = "value_b"
      "secret_value" = (sensitive value)
    }
    "sound" = "Bell"
  }
  "c" = {
    "color" = "Red"
    "language" = "French"
    "secret_config" = {
      "attribute" = "value_c"
      "secret_value" = (sensitive value)
    }
    "sound" = "Horn"
  }
  "d" = {
    "color" = "Yellow"
    "language" = "German"
    "secret_config" = {
      "attribute" = "value_d"
      "secret_value" = (sensitive value)
    }
    "sound" = "Whistle"
  }
}
```

## Tear Down

```bash
killall vault
```


