class TextWithSidebarContentBlock < ContentBlock
  field :body,          type: String
  field :sidebar,       type: String
  
  def self.display_name
    "Text mit Seitenleiste"
  end
end
