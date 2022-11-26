Como criar uma infraestrutura para hospedar uma aplicação react.js na aws utilizando:

Amazon 53
CloudFront (cdn)
Aplicar um certificado da AWS para o site ser HTTPS.
Hospedar os arquivos da aplicação em um bucket
Criar o redirecionamento de acesso www para o bucket.

Como funciona:
O usuário vai acessar a aplicação de fora da aws.
A route53 vai direcionar para o cache da aplicação (cdn).
A cdn vai verificar a região mais próxima do usuário e para retornar na menor latência
Caso já exista o cache na região, não vai acessar o bucket da aplicação.
Caso não exista, ele vai buscar as informações no bucket.
Caso o usuário acesse utilizando o "www." ele será redirecionado para o bucket central da aplicação.