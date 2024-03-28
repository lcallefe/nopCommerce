describe 'Meu primeiro script' do
  it 'visitar a página' do
    visit "https://opensource-demo.orangehrmlive.com/"
    expect(page.title).to eql 'OrangeHRM'
  end

  it 'fazer login com conta pré-existente' do
    visit "https://opensource-demo.orangehrmlive.com/"
    fill_in 'username', with: 'Admin'
    fill_in 'password', with: 'admin123'
    click_button 'Login'

    class_name = '.oxd-userdropdown-name'
    expect(find(class_name).visible?).to be true
    expect(find(class_name).text).to eql 'Bureau Judiciaire du foncier'
  end
end
