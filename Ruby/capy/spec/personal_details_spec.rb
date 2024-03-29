def login
  visit "https://opensource-demo.orangehrmlive.com/"
  fill_in "username", with: "Admin"
  fill_in "password", with: "admin123"
  click_button "Login"
end

#def scroll_down_page
# page.execute_script("window.scrollTo(0,document.body.scrollHeight/2);")
# end

describe "Detalhes pessoais" do
  it "visitar a página" do
    visit "https://opensource-demo.orangehrmlive.com/"
    expect(page.title).to eql "OrangeHRM"
  end

  it "verificar detalhes pessoais" do
    login
    click_link "My Info"
    expect(page).to have_content "Employee Full Name"
    expect(page).to have_content "Marital Status"
    expect(page).to have_content "Nationality"
  end

  it "altera dados pessoais", :sample => true do
    login
    click_link "My Info"
    # scroll_down_page => não vai precisar agora!
    dropdowns = page.all(".oxd-select-wrapper", count: 3)
    save_buttons = page.all("button[class$=orangehrm-left-space]", count: 2)

    # Altera nacionalidade
    dropdowns[0].click
    find("div[role=option]", text: "Bahamian").click

    # Clica no dropdown de marital status e seleciona 'casado'
    dropdowns[1].click
    find("div[role=option]", text: "Married").click

    # Salva alterações
    save_buttons[0].click

    # Altera tipo sanguíneo

    # find("div[class=oxd-select-text-input]", text: /^[A|B|O]{1,2}[+|-]\z/).click => faz a mesma coisa do que a linha de baixo
    dropdowns[2].click
    find("div[role=option]", text: "A+").click
    # Salva alterações
    save_buttons[1].click

    # Sai e retorna para a página
    click_link "Dashboard"
    click_link "My Info"

    # Valida que as alterações foram salvas com sucesso
    expect(page).to have_content "Married"
    expect(page).to have_content "Bahamian"
    expect(page).to have_content "A+"
  end
end
