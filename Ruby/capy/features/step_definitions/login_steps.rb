Quando('eu faço login com {string} e {string}') do |email, senha|
  @login.go
  @login.with(email, senha)
end


Então('devo ver a mensagem de alerta {string}') do |erro|
  expect(@login.error).to include erro
end






