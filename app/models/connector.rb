class Connector
  include Mongoid::Document
  
  belongs_to :page
  belongs_to :connectable, polymorphic: true
  
  field :container, type: String
end