data "aws_route53_zone" "this" {
  count = local.has_domain ? 1 : 0 
  name  = "${local.domain}."
}
#dominio principal
resource "aws_route53_record" "website" {
  count = local.has_domain ? 1 : 0 #valida se a entrada de registro informado ja existe, se sim não faz nada, senao registra

  name    = local.domain
  type    = "A"
  zone_id = data.aws_route53_zone.this[0].zone_id

  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.this.domain_name
    zone_id                = aws_cloudfront_distribution.this.hosted_zone_id
  }
}

#redirecionamento www
resource "aws_route53_record" "www" {
  count = local.has_domain ? 1 : 0 #valida se a entrada de registro informado ja existe, se sim não faz nada, senao registra

  name    = "www.${local.domain}"
  type    = "A"
  zone_id = data.aws_route53_zone.this[0].zone_id

  alias {
    evaluate_target_health = false
    name                   = module.redirect.website_domain
    zone_id                = module.redirect.hosted_zone_id
  }
}