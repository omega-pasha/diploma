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

  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "diploma-tf-backend"
    region   = "ru-central1"
    key      = "main/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true

  }

}
