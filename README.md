Criar uma infraestrutura para hospedar uma aplicação react.js com terraform:

Funcionalidades:

Configurar o Amazon 53
Criar o CloudFront (cdn)
Criar o AWS Certificate Manager (ACM)
Criar e configurar o S3 para hospedar os arquivos da aplicação
Criar o redirecionamento de acesso www para o bucket.

Instalação:

Clone esse repositorio.
Acesse a pasta 

Como funciona:
O usuário vai acessar a aplicação de fora da aws.
A route53 vai direcionar para o cache da aplicação (cdn).
A cdn vai verificar a região mais próxima do usuário e para retornar na menor latência
Caso já exista o cache na região, não vai acessar o bucket da aplicação.
Caso não exista, ele vai buscar as informações no bucket.
Caso o usuário acesse utilizando o "www." ele será redirecionado para o bucket central da aplicação.