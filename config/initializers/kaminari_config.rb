require 'kaminari'

Kaminari::Hooks.init

Kaminari.configure do |config|
  config.default_per_page = 25
  # config.max_per_page = nil
  # config.window = 4
  # config.outer_window = 0
  # config.left = 0
  # config.right = 0
  # config.page_method_name = :to_page
  # config.param_name = :to_page
end

