class ShippingAddressView
  include Capybara::DSL

  def set_shipping_address(shipping_address)
    country = shipping_address["country"]
    state = shipping_address["state"]
    zip_code = shipping_address["zip_code"]
    shipping_method = shipping_address["shipping_method"]

    unless shipping_address.values.all? &:empty?
      shipping_address_text_area.click
      select country, from: 'CountryId' unless country.empty?
      select state, from: 'StateProvinceId' unless state.empty?
      fill_in 'ZipPostalCode', with: zip_code unless zip_code.empty?
      shipping_method = "Ground" if shipping_method.empty? && (!country.empty? && !zip_code.empty?)
      find(:xpath, "//div[contains(text(),\"#{shipping_method}\")]/preceding-sibling::div").click unless shipping_method.empty?
      click_button "Apply"
    end
  end
 
  def shipping_address_text_area
    find('a[id^=open-estimate-shipping-popup]')
  end
 
  def alert_message
    find('.message-failure').text
  end
end