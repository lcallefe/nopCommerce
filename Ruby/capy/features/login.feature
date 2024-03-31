# language: pt
# encoding: utf-8

Funcionalidade: Login
  Para que eu possa realizar compras
  Sendo um usuário previamente cadastrado
  Posso acessar o sistema com meu e-mail e senha

@login_hapless
Esquema do Cenário: Login sem sucesso
  Quando eu faço login com <email> e <senha>
  Então devo ver a mensagem de alerta <alerta>

Exemplos: 
  |    email           |   senha   | alerta                                                                                                   |
  |"luciana@gmail.com" | "pwd1234" | "Login was unsuccessful. Please correct the errors and try again.The credentials provided are incorrect" |
  | "blabla"           | "pwd1234" | "Wrong email"                                                                                            | 
  | ""                 | "pwd123"  | "Please enter your email"                                                                                |

@login_happy
Cenário: Acesso
  Quando eu faço login com "luciana@gmail.com" e "pwd123"
  Então devo ver "Log out" na área logada

Cenário: Usuário nao existe
  Quando eu faço login com "blabla" e "pwd1234"
  Então devo ver a mensagem de erro "Wrong email"

@non_ecxiste
Cenário: Usuário não informado
  Quando eu faço login com "" e "pwd123"
  E devo ver a mensagem "Please enter your email"






