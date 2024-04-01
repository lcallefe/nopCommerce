class ProdutoPage
  include Capybara::DSL

  def go(produto)
    file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/add-to-cart.yaml"))
    nome_do_produto = file[produto]["nome_do_produto"]
    url_produto = nome_do_produto.tr(" ", "-").downcase
    visit "/#{url_produto}"
  end
end