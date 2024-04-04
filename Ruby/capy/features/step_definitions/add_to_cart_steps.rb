Dado ('que estou na página do {string}') do |apparel_item_code|
  @apparel_item = @file[apparel_item_code]
  @apparel_item_page.go(@apparel_item["apparel_item_name"])
end

Quando('adiciono o item ao carrinho') do
  @apparel_item_page.create(@apparel_item)
end

Quando('adiciono o {string}') do |shipping_address_code|
  @apparel_item_page.form.set_shipping_address(@file[shipping_address_code])
end

Então('devo ver o {string} na pagina do produto') do |full_shipping_address|
  expect(@apparel_item_page.form.shipping_address_text_area).to have_content full_shipping_address
end


E('o carrinho de compras contendo o item adicionado') do
  @shopping_cart = @apparel_item_page.shopping_cart_dropdown
  @price = @apparel_item["price"]
  @quantity = @apparel_item["quantity"]
  @unit_price = Money.from_amount(@price).format 
  @total_price = Money.from_amount(@price * @quantity).format 
  expect(@apparel_item_page.shopping_cart_link).to have_text "Shopping cart (#{@quantity})"
  expect(@shopping_cart).to have_content "There are #{@quantity} item(s) in your cart"
  expect(@shopping_cart).to have_content "Quantity: #{@quantity}"
  expect(@shopping_cart).to have_content "Unit price: #{@unit_price}"
  expect(@shopping_cart).to have_content "Sub-Total: #{@total_price}"
  expect(@shopping_cart).to have_button "Go to cart"
end


Então('devo ver uma {string}') do |alert_message|
  expect(@apparel_item_page.form.alert_message).to eql alert_message
end


Então('devo ver uma mensagem de confirmação') do
  expect(@apparel_item_page.success_message).to eql "The product has been added to your shopping cart"
end





