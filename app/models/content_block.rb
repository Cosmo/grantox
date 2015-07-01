class ContentBlock
  include Mongoid::Document
  include Mongoid::Versioning
  
  embeds_many :attachments, as: :attachable
  has_many :connectors, as: :connectable
  
  field :name, type: String
  
  def self.display_name
    self.to_s
  end
  
  def render_view
    ActionController::Base.helpers.render :file => "app/views/connectables/#{self.class.to_s.underscore.pluralize}/render.html.erb", :locals => { content_block: self }
  end
end