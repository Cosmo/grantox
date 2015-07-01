class TextWithTitleContentBlock < ContentBlock
  field :title,   type: String
  field :body,    type: String
  
  def self.display_name
    "Text mit Titel"
  end
end