class Connector
  include Mongoid::Document
  
  belongs_to :page
  belongs_to :connectable, polymorphic: true
  
  field :container, type: String
  
  def render_view
    self.connectable.render_view
  end
end