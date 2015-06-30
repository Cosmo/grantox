class Section
  include Mongoid::Document
  
  has_one :section_node, :as => :linkable
  
  field :name,    type: String
  field :path,    type: String
  field :hidden,  type: Boolean, default: false
end