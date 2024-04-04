class ApparelItemPage
  include Capybara::DSL

  def form 
    ShippingAddressView.new
  end

  def color_or_size(param)
   "//select[contains(@name,'product_attribute')]//option[text()='#{param}']"
  end
  
  def go(apparel_item_name)
    visit "/#{apparel_item_name.tr(" ", "-").downcase}"
  end

  def set_size(size)
    find(:xpath, color_or_size(size)).click
  end
  
  def set_quantity(quantity)
    quantity_field = find("input[id^=product_enteredQuantity]")
    quantity_field.send_keys :clear
    quantity_field.set(quantity)
  end

  def set_custom_text(custom_text)
    find(:xpath, "//div[@class='attributes']//input").set(custom_text)
  end

  def shopping_cart_link
    find('.ico-cart')
  end

  def set_color(color)
    if page.has_xpath?(color_or_size(color)) 
      find(:xpath, color_or_size(color)).click
    else
      find(:xpath, "//span[@style=\'background-color:#{color}\']").click
    end
  end

  def shopping_cart_dropdown
    Capybara.ignore_hidden_elements = false 
    find('.mini-shopping-cart')
  end

  def set_print(print)
    find(:xpath, "//span[contains(@style,\'#{print}\')]").click
  end

  def success_message
    find('.bar-notification').text
  end


  def create(apparel_item)
    apparel_item.each do |key, value|
      next if key == "apparel_item_name" || key == "price"
      method_name = "set_#{key}".to_sym
      send("#{method_name}", "#{value}")
    end
    find(".add-to-cart-panel button").click  
  end
end
