module Grantox
  class Connector
    include Mongoid::Document
    
    belongs_to :page, class_name: 'Grantox::Page'
    belongs_to :connectable, polymorphic: true
    
    field :container, type: String
    field :position,  type: Integer, default: 0
    
    before_create :reorder_before_create
    after_destroy :reorder_after_destroy
    
    def render_view
      self.connectable.render_view
    end
    
    def to_s
      ActionController::Base.helpers.strip_tags(self.connectable.render_view)
    end
    
    def reorder_with_position(position)
      connections = self.page.connectors.where(container: self.container).asc(:position)
      past_self = false
      (connections - [self]).each_with_index do |connection, index|
        if index == position
          past_self = true
        end
        connection.position = index + (past_self ? 1 : 0)
        connection.save
      end
      self.position = position
      self.save
    end
    
    def reorder_after_destroy
      connections = self.page.connectors.where(container: self.container).asc(:position)
      connections.each_with_index do |connection, index|
        connection.position = index
        connection.save
      end
    end
    
    def reorder_before_create
      last_connector = self.page.connectors.where(container: self.container).asc(:position).last
      if last_connector.present?
        self.position = last_connector.position + 1
      end
    end
  end
end