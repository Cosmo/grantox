module ApplicationHelper
  def container(container_name)
    output = []
    Page.first.connectors.where(container: container_name.to_s).each do |connector|
      output << connector.render_view
    end
    ActionController::Base.helpers.raw output.join("")
  end
end
