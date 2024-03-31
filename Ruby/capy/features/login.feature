# language: pt
# encoding: utf-8

Funcionalidade: Login
  Para que eu possa realizar compras
  Sendo um usuário previamente cadastrado
  Posso acessar o sistema com meu e-mail e senha

@login_hapless
Esquema do Cenário: Login sem sucesso
  Quando eu faço login com <email> e <senha>
  Então devo ver a mensagem de alerta <erro> 

Exemplos: 
  |    email           |   senha   | erro                      |                                                                               
  |"luciana@gmail.com" | "pwd1234" | "Login was unsuccessful." |  
  | "blabla"           | "pwd1234" | "Wrong email"             |                                                                                
  | ""                 | "pwd123"  | "Please enter your email" |                                                                           







