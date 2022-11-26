//adiciona o policy.json ao bucket, 
//para liberação de visualização do objeto publicamente
data "template_file" "s3-public-policy"{
    template = file("policy.json") #chama o template
    vars = { bucket_name = local.domain}
}

