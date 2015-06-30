class SectionNode
  include Mongoid::Document
  include Mongoid::Tree
  include Mongoid::Tree::Ordering
  include Mongoid::Tree::Traversal
  
  belongs_to :linkable, :polymorphic => true
  
  field :slug,  type: String
end