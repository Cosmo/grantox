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
    
    def render_view
      ActionController::Base.helpers.render :file => Grantox::Engine.root.join("app/views/grantox/connectables/#{self.class.to_s.demodulize.underscore.pluralize}/render.html.erb"), :locals => { content_block: self }
    end
    
    def to_s
      ActionController::Base.helpers.strip_tags(self.render_view)
    end
  end
end