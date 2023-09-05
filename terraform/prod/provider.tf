provider "yandex" {
  service_account_key_file = "authorized_key.json"
  cloud_id                 = "b1g8dacglmlq7d7hed97"
  folder_id                = "b1glodb3fcb408dgl593"
}

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  cloud{
    organization = "netology_diploma"

    workspaces {
      name = "prod-ws"
    }
  }
}