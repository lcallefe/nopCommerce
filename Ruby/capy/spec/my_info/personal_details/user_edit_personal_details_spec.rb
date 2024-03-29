describe "Detalhes pessoais" do
  before(:each) do
    visit "https://opensource-demo.orangehrmlive.com/"
    fill_in "username", with: "Admin"
    fill_in "password", with: "admin123"
    click_button "Login"
    click_link "My Info"
  end

  it "verificar detalhes pessoais" do
    expect(page).to have_content "Employee Full Name"
    expect(page).to have_content "Marital Status"
    expect(page).to have_content "Nationality"
  end

  it "altera dados pessoais", :sample => true do
    # scroll_down_page => não vai precisar agora!
    dropdowns = page.all(".oxd-select-wrapper", count: 3)
    save_buttons = page.all("button[class$=orangehrm-left-space]", count: 2)

    # Altera nacionalidade
    dropdowns[0].click
    find("div[class=orangehrm-container]", text: "Bahamian").click

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

  it "checkbox", :checkbox => true do
    element = first("span[class^=oxd-checkbox-input]")

    page.scroll_to(element)
    element.set(true)

    element.checked?
  end

  it "radio_button", :radio_button => true do
    element = page.all("span[class^=oxd-radio-input]")[1]

    element.click

    element.selected?
  end
end
