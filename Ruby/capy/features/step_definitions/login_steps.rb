Quando('eu faço login com {string} e {string}') do |email, password|
  visit '/login'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end


Então('devo ver {string} na área logada') do |error_message|

  error = find('.header-links .ico-logout')
  # ou
  expect(error).to have_text error_message

end


Então('devo ver a mensagem de erro {string}') do |error_message|
  expect(page).to have_text error_message
end

Então('devo ver a mensagem {string}') do |alert_message|
  error = find('.inputs span #Email-error')

  expect(error.text).to eql alert_message
end



Então('ver a mensagem de erro') do |expected_message|
  error = find('.inputs span #Email-error')

  expect(error.text).to eql expected_message
end



