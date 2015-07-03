module Grantox
  class RssContentBlock < ContentBlock
    field :url,    type: String

    def self.display_name
      "RSS Reader"
    end
  end
  
end