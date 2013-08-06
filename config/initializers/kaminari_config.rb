Kaminari.configure do |config|
  config.default_per_page = configus.pagination.default
  config.page_method_name = :page
  config.param_name = :page
end
