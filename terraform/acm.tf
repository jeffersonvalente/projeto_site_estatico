resource "aws_acm_certificate" "this" {
    count = local.has_domain ? 1 : 0 
    domain_name = local.domain
    validation_method = "DNS"
    subject_alternative_names = ["*.${local.domain}"]
}

resource "aws_acm_certificate_validation" "this"{
    count = local.has_domain ? 1 : 0 
    certificate_arn = aws_acm_certificate.this[0].arn #como são dois counts, precisa fazer uma lista e pegar o indice 0
    validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
