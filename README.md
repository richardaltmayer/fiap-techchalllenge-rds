# fiap-techchalllenge-rds

Projeto responsável por gerar a infraestutura de banco de dados gerenciável na AWS, utilizando Terraform.

## Modelo de dados
![modelo-er](https://github.com/richardaltmayer/fiap-techchalllenge-rds/assets/10313123/fef1d7ac-bbe3-41d0-a426-83ccefde9717)

- customer: relaciona os clientes cadastrados.
- product: relaciona os produtos comercializados.
- order: armazena os dados dos pedidos realizados pelos clientes.
- order_item: armazena a relação de itens vinculados em cada pedido.
- item: representa as opções disponíveis no menu do usuário. Um item pode conter:
  - 1 produto: item simples.
  - Mais de um produto: combo de produtos.
- item_product: vincula a relação do item com o(s) produto(s).
- image: indica a representação da imagem de cada produto ou item.

## Justificativa

O banco de dados definido para a solução é o MySQL, um banco de dados _open source_. 

A escolha por esse banco de dados se deu considerando a natureza da aplicação desenvolvida. Dessa forma, optou-se pela utilização de um banco de dados relacional em virtude das vantagens oferecidas por esse modelo, dentre as quais, a importância da integridade dos dados.
