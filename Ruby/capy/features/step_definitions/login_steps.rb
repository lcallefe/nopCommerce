Quando('eu faço login com {string} e {string}') do |email, senha|
  @login_page.go
  @login_page.with(email, senha)
end


Então('devo ver a mensagem de alerta {string}') do |erro|
  expect(@login_page.error).to include erro
end







