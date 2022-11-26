#tags commons
#caso não tenha um dominio, seta um dominio random_pet
locals {
  has_domain      = var.domain != ""
  domain          = local.has_domain ? var.domain : random_pet.website.id
  regional_domain = module.website.regional_domain_name

  common_tags = {
    Project   = "Projeto Site Estatico"
    Service   = "Site do Jeffin"
    CreatedAt = "2022-11-26"
    Module    = "3"
  }
}