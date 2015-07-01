class Section < Node
  field :name,    type: String
  field :path,    type: String
  field :hidden,  type: Boolean, default: false
end