Dado ('que estou na página do {string}') do |apparel_item_code|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/add-to-cart.yaml"))
  @apparel_item = file[apparel_item_code]
  @apparel_item_page.go(@apparel_item)
end

Quando('adiciono o item ao carrinho') do
  @apparel_item_page.create(@apparel_item)
end

E('o carrinho de compras contendo o item adicionado') do
  expect(@apparel_item_page.shopping_cart_link).to eql "Shopping cart (#{@apparel_item["quantity"]})"
end

E('seleciono o endereço para entrega') do
  country = @apparel_item["shipping_address"]["country"]
  state = @apparel_item["shipping_address"]["state"]
  zip_code = @apparel_item["shipping_address"]["zip_code"]
  shipping_method = @apparel_item["shipping_address"]["shipping_method"]
  
  if state == 'Other'
    validation_string = "#{country}, #{zip_code} via #{shipping_method}"
  else 
    validation_string = "#{country}, #{state}, #{zip_code} via #{shipping_method}"
  end 
  expect(@apparel_item_page.shipping_address).to have_content validation_string
end

Então('devo ver uma mensagem de confirmação') do
  expect(@apparel_item_page.success_message).to eql "The product has been added to your shopping cart"

end





