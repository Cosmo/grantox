module Grantox
  module ApplicationHelper
    def container(container_name)
      output_prefixes = []
      output          = []
      output_suffixes = []

      if @page.present? && visual_edit
        output_prefixes << connector_toolbar(container_name, @page)
        @page.connectors.where(container: container_name.to_s).asc(:position).each do |connector|
          if visual_edit
            connectable_view = render_editable_view(connector)
          else
            connectable_view = render_view(connector)
          end
          output << connectable_view
        end
        output_suffixes << connector_toolbar(container_name, @page)
        
        ActionController::Base.helpers.raw([
          output_prefixes.join(""), 
          content_tag(:div, ActionController::Base.helpers.raw(output.join("")), class: "content-blocks"),
          output_suffixes.join("")
        ].join(""))
      elsif @page.present? && @page.views_cache[container_name].present?
        ActionController::Base.helpers.raw(@page.views_cache[container_name])
      else
        "Page has no content."
      end
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
      connectable = connector.connectable
      
      content_tag(:div, class: "cms-edit-border", data: { :"move-path" => send(:"move_connector_path", connector) }) do
        @content = content_tag(:div, class: "cms-edit-toolbar") do
          @buttons = link_to("Edit", send(:"edit_#{connectable.class.path_name}_path", connectable))
          @buttons << ", "
          @buttons << link_to("Remove", connector_path(connector), method: :delete)
          @buttons << ", "
          @buttons << "<strong>#{connectable.class.display_name}</strong>: #{connectable.name}".html_safe
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

    def cms_head
      content_tag(:title, @page.computed_title)
    end

    def cms_toolbar
      render :file => "grantox/cms/toolbar.html.erb"
    end
  end
end
