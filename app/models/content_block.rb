class ContentBlock
  include Mongoid::Document
  include Mongoid::Versioning
  embeds_many :attachments, as: :attachable
end