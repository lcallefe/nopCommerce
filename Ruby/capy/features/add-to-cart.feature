# language: pt
# encoding: utf-8

Funcionalidade: Adicionar item de vestuário ao carrinho de compras
  Para que eu possa efetuar uma compra de um item de vestuário
  Sendo um usuário previamente cadastrado
  Posso adicionar um ou mais items ao carrinho de compras

@add_item
Esquema do Cenário: Item adicionado ao carrinho com sucesso
  Dado que estou na página do <item_de_vestiario>
  Quando adiciono o item ao carrinho
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

@shipping_address
Esquema do Cenário: Adicionando endereço
  Dado que estou na página do <item_de_vestiario>
  Quando adiciono o <endereco_de_entrega>
  Então devo ver o <endereco_completo> na pagina do produto

Exemplos: 
  |item_de_vestiario  | endereco_de_entrega                        | endereco_completo                                |
  |"cap"              | "no_shipping_address"                      | "Please select the address you want to ship to"  |
  |"sunglasses"       | "full_shipping_address"                    | "United States, Arizona, 12345 via Ground"       | 
  |"custom_tshirt"    | "missing_state_shipping_address"           | "Brazil, 12345 via Next Day Air"                 |
  |"custom_tshirt"    | "missing_shipping_method_shipping_address" | "Brazil, 22222 via Ground"                       |


@missing_fields_shipping_address
Cenário: Endereço com dados faltantes
  Dado que estou na página do <item_de_vestiario>
  Quando adiciono o <endereco_de_entrega>
  Então devo ver uma <mensagem_de_alerta> 

Exemplos: 
  |item_de_vestiario      | endereco_de_entrega                        | mensagem_de_alerta              |
  |"medium_mint_shoes"    | "missing_country_shipping_address"         | "Country is required"           |
  |"sunglasses"           | "missing_zip_code_shipping_address"        | "Zip / postal code is required" | 









  






