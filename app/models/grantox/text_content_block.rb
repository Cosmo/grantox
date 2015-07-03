module Grantox
  class TextContentBlock < ContentBlock
    field :body,    type: String

    def self.display_name
      "Text"
    end
  end
  
end