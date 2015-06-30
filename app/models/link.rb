class Link
  include Mongoid::Document
  include Mongoid::Versioning
  
  has_one :section_node, :as => :linkable
end