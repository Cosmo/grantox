module ApplicationHelper
  def container(container_name)
    output = []
    
    if @page.present?
      if visual_edit
        output << connector_toolbar(container_name, @page)
      end
      
      @page.connectors.where(container: container_name.to_s).each do |connector|
        if visual_edit
          connectable_view = render_editable_view(connector)
        else
          connectable_view = render_view(connector)
        end
        output << connectable_view
      end
      
      if visual_edit
        output << connector_toolbar(container_name, @page)
      end
    end
    
    ActionController::Base.helpers.raw output.join("")
  end
  
  def connector_toolbar(container_name, page)
    content_tag(:div, class: "cms-page-edit-toolbar") do
      @buttons = link_to("+", new_connector_path(container: container_name, page_id: page.id))
    end
  end
  
  def render_view(connector)
    connector.render_view
  end
  
  def render_editable_view(connector)
    content_tag(:div, class: "cms-edit-border") do
      @content = content_tag(:div, class: "cms-edit-toolbar") do
        @buttons = link_to("Edit", send(:"edit_#{connector.connectable.class.to_s.underscore}_path", connector.connectable))
        @buttons << ", "
        @buttons << link_to("Remove", connector_path(connector), method: :delete)
        @buttons << ", "
        @buttons << "(#{connector.connectable.class.display_name})"
      end
      @content << content_tag(:div, connector.render_view, class: "cms-edit-content")
    end
  end
  
  def render_menu
    entries = @page.siblings_and_self.map do |descendant|
      content_tag(:li) do
        if descendant.class == Page || descendant.children.to_a.find { |child| child.class == Page }
          content_tag(:a, href: descendant.path) do
            descendant.name
          end
        else
          descendant.name
        end
      end
    end
    menu = content_tag(:ul, ActionController::Base.helpers.raw(entries.join("")))
    ActionController::Base.helpers.raw menu
  end
  
  def cms_toolbar
    render :file => "app/views/cms/toolbar.html.erb"
  end
end
