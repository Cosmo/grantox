class Page
  include Mongoid::Document
  include Mongoid::Versioning
  
  has_one :section_node, :as => :linkable
  
  field :name,                type: String
  field :title,               type: String
  field :path,                type: String
  field :template_file_name,  type: String
  field :description,         type: String
  field :keywords,            type: String
  field :archived,            type: Boolean, default: false
  field :published,           type: Boolean, default: false
  
  field :valid_from,          type: DateTime
  field :valid_to,            type: DateTime
end