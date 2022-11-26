# Objetivo:

Criar uma infraestrutura para hospedar uma aplicação react.js usando o terraform:

![plano](https://user-images.githubusercontent.com/73920079/204109899-87422768-0fc7-43e2-a34f-919048c2e294.png)

# Funcionalidades:

Configurar o Amazon 53

Criar o CloudFront (cdn)

Criar o AWS Certificate Manager (ACM)

Criar e configurar o S3 para hospedar os arquivos da aplicação

Criar o redirecionamento de acesso www para o bucket.

# Como funciona:

O usuário vai acessar o endereço da aplicação.

A route53 vai direcionar para o cache da aplicação (cdn).

A cdn vai verificar a região mais próxima do usuário e para poder retornar na menor latência.

Caso já exista o cache na região, não vai acessar o bucket da aplicação.

Caso não exista o cache ou ele esteja expirado, ele vai buscar as informações no bucket.

Se o usuário entrar com www, ele vai ser redirecionado para o bucket sem www, para que seja centralizado o armazenamento da aplicação
