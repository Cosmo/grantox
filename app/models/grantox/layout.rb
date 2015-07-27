module Grantox
  class Layout
    def self.installed
      Dir["#{Grantox::Engine.root}/app/views/layouts/grantox/templates/**/*.html.erb"].map { |m| File.basename(m, ".*") }
    end
  end
end