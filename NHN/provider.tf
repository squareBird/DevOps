terraform {
  required_version = ">= 1.0.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.42.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "cloudmsp@wins21.co.kr"
  tenant_id   = "649bbc87313648de8d55b9ed50ca4b3e"
  password    = "sniper12#$"
  auth_url    = "https://api-identity.infrastructure.cloud.toast.com/v2.0"
  region      = "KR1"
}
