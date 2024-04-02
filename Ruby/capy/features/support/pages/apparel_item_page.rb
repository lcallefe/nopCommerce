class ApparelItemPage
  include Capybara::DSL
  
  def go(apparel_item)
    apparel_item_name = apparel_item["apparel_item_name"]
    url_apparel_item = apparel_item_name.tr(" ", "-").downcase
    visit "/#{url_apparel_item}"
  end

  def set_size
    xpath_size = "//div[@class='attributes']//dt/label[contains(text(),'Size')]/parent::*/following-sibling::dd[1]//select"
    xpath_size_option = xpath_size + "/option[text()=\'#{@size}\']"
    # não deu certo de setar o select   
    find(:xpath, xpath_size_option).click
  end
  
  def set_quantity
    css_quantity = "input[id^=product_enteredQuantity]"
    find(css_quantity).set(@quantity)
  end

  def set_text
    xpath_custom_text = "//div[@class='attributes']//input" 
    find(:xpath, xpath_custom_text).set(@custom_text)
  end


  def set_color
    xpath_color = "//div[@class='attributes']//dt/label[contains(text(),'Color')]/parent::*/following-sibling::dd[1]//select"
    if page.has_xpath?(xpath_color)
      xpath_color_option = xpath_color+"/option[text()=\'#{@color}\']"
      p xpath_color_option
      # não deu certo de setar o select   
      find(:xpath, xpath_color_option).click
    else
      xpath_background_color = "//span[@style=\'background-color:#{@color}\']"
      find(:xpath, xpath_background_color).click
    end
  end

  def set_print
    xpath_print = "//span[contains(@style,\'#{@print}\')]"
    find(:xpath, xpath_print).click
  end

  def set_shipping_address 
    p 'hihihihih'
    p @shipping_address["zip_code"]
    shipping_address.click
    select @shipping_address["country"], from: 'CountryId'
    select @shipping_address["state"], from: 'StateProvinceId'
    fill_in 'ZipPostalCode', with: "#{@shipping_address["zip_code"]}"
    find(:xpath, "//div[contains(text(),\"#{@shipping_address["shipping_method"]}\")]/preceding-sibling::div").click
    click_button "Apply"
  end

  def shipping_address
    find('a[id^=open-estimate-shipping-popup]')
  end

  def success_message
    find('.bar-notification').text
  end

  def shopping_cart_link
    find('.ico-cart').text
  end


  def fill_fields(key, value)
    case key
    when "print"
      @print = value
      set_print
    when "size"
      @size = value
      set_size
    when "color"
      @color = value
      set_color
    when "quantity"
      @quantity = value
      set_quantity 
    when "custom_text"
      @custom_text = value
      set_text
    when "shipping_address" 
      @shipping_address = value
      set_shipping_address
    end
   end

  def create(apparel_item)
    apparel_item.each do |key, value|
      next if key == "apparel_item_name" || key.nil?
      fill_fields(key, value)
      p key 
      set_shipping_address if key == shipping_address
    end
    find("div[class=add-to-cart-panel] button").click
  end
end
