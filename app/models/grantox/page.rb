module Grantox
  class Page < Node
    include Mongoid::Versioning
    
    belongs_to :section, class_name: 'Grantox::Section'
    has_many :connectors, class_name: 'Grantox::Connector', dependent: :destroy
    
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
    
    before_save :cache_page
    
    def computed_title
      self.title.present? ? self.title : self.name
    end
    
    def clear_cache
      self.views_cache = {}
      self.texts_cache = {}
    end
    
    def cache_page
      self.clear_cache
      self.connectors.map(&:container).uniq.each do |container|
        cache_views_for_container(container)
        cache_texts_for_container(container)
      end
    end
    
    def cache_views_for_container(container)
      output = ""
      self.connectors.where(container: container).asc(:position).each do |connector|
        output << connector.render_view
      end
      self.views_cache[container] = output
    end
    
    def cache_texts_for_container(container)
      output = ""
      self.connectors.where(container: container).asc(:position).each do |connector|
        output << connector.to_s
      end
      self.texts_cache[container] = output
    end
  end
end