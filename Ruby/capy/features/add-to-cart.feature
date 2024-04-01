# language: pt
# encoding: utf-8

Funcionalidade: Adicionar produto de vestuário ao carrinho de compras
  Para que eu possa efetuar uma compra de um item de vestuário
  Sendo um usuário previamente cadastrado
  Posso adicionar um ou mais produtos ao carrinho de compras


Cenário: Camiseta comum adicionada ao carrinho a partir da página do produto
  Dado que estou na página do produto
  Quando seleciono o tamanho
  E informo o endereço para entrega
  E informo a quantidade do produto
  E adiciono produto ao carrinho
  E vou para a página de checkout
  Então devo ver o produto no carrinho de compras


Cenário: Calça personalizada adicionada ao carrinho a partir da página do produto
  Dado que estou na página do produto
  Quando informo o endereço para entrega
  E informo a quantidade do produto
  E adiciono produto ao carrinho
  E vou para a página de checkout
  Então devo ver o produto no carrinho de compras


Cenário: Tênis adicionado ao carrinho a partir da página do produto
  Dado que estou na página do produto
  Quando informo o endereço para entrega
  E informo a quantidade do produto
  E seleciono a cor
  E seleciono o tamanho
  E adiciono produto ao carrinho
  E vou para a página de checkout
  Então devo ver o produto no carrinho de compras


Cenário: Boné adicionado ao carrinho a partir da página do produto
  Dado que estou na página do produto
  Quando informo o endereço para entrega
  E informo a quantidade do produto
  E seleciono o tamanho
  E adiciono produto ao carrinho
  E vou para a página de checkout
  Então devo ver o produto no carrinho de compras

Cenário: Item adicionado ao carrinho a partir de produtos similares recomendados
  Dado que estou na página do produto
  Quando vejo um produto similar
  E adiciono produto ao carrinho
  E vou para a página de checkout
  Então devo ver o produto no carrinho de compras


Cenário: Tamanho não informado
  Dado que estou na página do produto
  Quando não seleciono o tamanho
  E adiciono produto ao carrinho
  Então devo ver a mensagem "Please select Size"

Cenário: Estampa não informada
  Dado que estou na página do produto
  Quando não seleciono a estampa
  E adiciono produto ao carrinho
  Então devo ver a mensagem "Please select Print"

Cenário: Cor não informada
  Dado que estou na página do produto
  Quando não seleciono a cor
  E adiciono produto ao carrinho
  Então devo ver a mensagem "Please select Color"





