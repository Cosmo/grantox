module ApplicationHelper
  def container(container_name)
    output = []
    editable = true
    
    if @page.present?
      if editable
        output << connector_toolbar(container_name, @page)
      end
      
      @page.connectors.where(container: container_name.to_s).each do |connector|
        if editable
          connectable_view = render_editable_view(connector)
        else
          connectable_view = render_view(connector)
        end
        output << connectable_view
      end
      
      if editable
        output << connector_toolbar(container_name, @page)
      end
    end
    
    ActionController::Base.helpers.raw output.join("")
  end
  
  def connector_toolbar(container_name, page)
    content_tag(:div, class: "cms-page-edit-toolbar") do
      link_to("Add", new_connector_path(container: container_name, page_id: page.id))
    end
  end
  
  def render_view(connector)
    connector.render_view
  end
  
  def render_editable_view(connector)
    content_tag(:div, class: "cms-edit-border") do
      @content = content_tag(:div, class: "cms-edit-toolbar") do
        link_to("Remove", connector_path(connector), method: :delete)
        # content_tag(:a, class: "cms-edit-toolbar-button", href: "#") do
        #   "Remove"
        # end
      end
      @content << content_tag(:div, connector.render_view, class: "cms-edit-content")
    end
  end
end
