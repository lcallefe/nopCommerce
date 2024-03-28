describe 'Meu primeiro script' do
  it 'visitar a página' do
    visit "https://www.webmotors.com.br/"
    expect(page.title).to include 'Webmotors'
  end
end