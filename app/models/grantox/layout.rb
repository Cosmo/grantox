module Grantox
  class Layout
    def self.installed
      Dir["#{Rails.root}/app/views/layouts/grantox/templates/**/*.html.erb"].map { |m| File.basename(m, ".*") }
    end
  end
end