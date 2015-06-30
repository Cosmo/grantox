class ContentBlock
  include Mongoid::Document
  include Mongoid::Versioning
  
  embeds_many :attachments, as: :attachable
  
  has_many :connectors, as: :connectable
end