module Grantox
  class Page < Node
    include Mongoid::Versioning

    belongs_to :section, class_name: 'Grantox::Section'
    has_many :connectors, class_name: 'Grantox::Connector'

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
    
    field :views_cache,         type: Hash, default: {  }
    field :texts_cache,         type: Hash, default: {  }
    
    def computed_title
      self.title.present? ? self.title : self.name
    end
  end
end