class LoginPage
include Capybara::DSL
  def go
    visit '/login'
  end

  def with(email, senha)
    find("#Email").set(email)
    find("#Password").set(email)
    click_button 'Log in'
  end

  def error
    error_message_selector_span = "//span[@class[contains(.,'error')]]"
    if page.has_xpath?(error_message_selector_span)
      return find(:xpath, error_message_selector_span).text
    end
    return find(:xpath, "//*[@class[contains(.,'error')]]").text
  end

  def logout 
    find(".ico-logout").text
  end
end