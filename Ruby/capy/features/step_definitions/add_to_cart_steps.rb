Dado ('que estou na página do {string}') do |codigo_produto|
  @produto_page.go(codigo_produto)
  sleep 10
end



Quando('adiciono produto ao carrinho') do

end

Então('devo ver o produto no carrinho de compras') do
  pending # Write code here that turns the phrase above into concrete actions
end