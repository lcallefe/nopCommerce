
Before do
  @login_page = LoginPage.new
  @apparel_item_page = ApparelItemPage.new 
  @file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/add-to-cart.yaml"))
end



