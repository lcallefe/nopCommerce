# language: pt
# encoding: utf-8

Funcionalidade: Adicionar produto de vestuário ao carrinho de compras
  Para que eu possa efetuar uma compra de um item de vestuário
  Sendo um usuário previamente cadastrado
  Posso adicionar um ou mais produtos ao carrinho de compras

@adiciona_produto
Esquema do Cenário: Pedido adicionado ao carrinho com sucesso
  Dado que estou na página do <produto>
  Quando adiciono produto ao carrinho
  Então devo ver o produto no carrinho de compras

  Exemplos:
    | produto                |
    | "calca"                  |
    | "sapato"                 |
    | "camiseta"               |
    | "camiseta_personalizada" |
    | "bone"                   |
    | "sapato_personalizado"   |

# WIP
# Esquema do cenário: Informação faltante
  #Dado que estou na página do produto
  #Quando não seleciono a <informação>
  #E adiciono produto ao carrinho
  #Então devo ver a mensagem de erro
  
Cenário: Item adicionado ao carrinho a partir de produtos similares recomendados
  Quando vejo um produto similar
  E adiciono produto ao carrinho
  E vou para a página de checkout
  Então devo ver o produto no carrinho de compras






