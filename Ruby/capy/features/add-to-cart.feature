# language: pt
# encoding: utf-8

Funcionalidade: Adicionar item de vestuário ao carrinho de compras
  Para que eu possa efetuar uma compra de um item de vestuário
  Sendo um usuário previamente cadastrado
  Posso adicionar um ou mais items ao carrinho de compras

@adiciona_item_de_vestiario
Esquema do Cenário: Item adicionado ao carrinho com sucesso
  Dado que estou na página do <item_de_vestiario>
  Quando adiciono o item ao carrinho
  E seleciono o endereço para entrega
  Então devo ver uma mensagem de confirmação
  E o carrinho de compras contendo o item adicionado

  Exemplos:
    | item_de_vestiario        |
    | "running_tshirt"         |
    | "custom_tshirt"          |
    | "oversized_tshirt"       |
    | "custom_running_shoes"   |
    | "medium_mint_shoes"      |
    | "common_running_shoes"   |
    | "cap"                    |
    | "sunglasses"             |



  






