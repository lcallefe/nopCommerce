Dado ('que estou na página do {string}') do |codigo_produto|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/add-to-cart.yaml"))
  p "jskjdklasjdkjaslkjdklajskdjlaksjdklajs"
  p file
end



Quando('adiciono produto ao carrinho') do

end

Então('devo ver o produto no carrinho de compras') do
  pending # Write code here that turns the phrase above into concrete actions
end