//adiciona o policy.json ao bucket, 
//para liberação de visualização do objeto publicamente
data "template_file" "s3-public-policy" {
  template = file("policy.json")
  vars = {
    bucket_name = local.domain
    cdn_oai     = aws_cloudfront_origin_access_identity.this.id
  }
}

#reutiliza modulos do git para facilitar a criação
module "logs" {
  source        = "github.com/chgasparoto/terraform-s3-object-notification"
  name          = "${local.domain}-logs"
  acl           = "log-delivery-write"
  force_destroy = true
  tags          = local.common_tags
}

module "website" {
  source        = "github.com/chgasparoto/terraform-s3-object-notification"
  name          = local.domain
  acl           = "public-read"
  policy        = data.template_file.s3-public-policy.rendered
  force_destroy = true
  tags          = local.common_tags

  versioning = {
    enabled = true
  }

  filepath = "${path.module}/../website/build"
  website = {
    index_document = "index.html"
    error_document = "index.html"
  }

  logging = {
    target_bucket = module.logs.name
    target_prefix = "access/"
  }
}

module "redirect" {
  source        = "github.com/chgasparoto/terraform-s3-object-notification"
  name          = "www.${local.domain}"
  acl           = "public-read"
  force_destroy = true
  tags          = local.common_tags

  website = {
    redirect_all_requests_to = local.has_domain ? var.domain : module.website.website
  }
}