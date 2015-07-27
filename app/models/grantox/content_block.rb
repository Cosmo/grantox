module Grantox
  class ContentBlock
    include Mongoid::Document
    include Mongoid::Versioning

    embeds_many :attachments, as: :attachable, class_name: "Grantox::Attachment"
    has_many :connectors, as: :connectable, class_name: "Grantox::Connector"

    field :name, type: String

    def self.display_name
      self.to_s
    end
    
    def to_s
      ActionController::Base.helpers.strip_tags(self.render_view)
    end
    
    def render_view
      ActionController::Base.helpers.render :file => render_path, :locals => { content_block: self }
    end
    
    
    
    def self.path_name
      self.to_s.demodulize.underscore
    end
    
    
    def self.model_name_from_string(string)
      string.singularize.classify.constantize
    end
    
    def render_path
      ContentBlock.directory.join "#{self.class.path_name.pluralize}/render.html.erb"
    end
    
    def self.directory
      Grantox::Engine.root.join("app/views/grantox/content_blocks")
    end
    
    def self.installed
      Dir[directory.join("*_content_blocks")].map { |c| File.basename(c) }
    end
    
    def self.installed_models
      installed.map { |c| "Grantox::#{c.singularize.classify}".constantize }
    end
  end
end