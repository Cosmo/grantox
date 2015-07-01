class PagesController < ApplicationController
  layout "layouts/templates/default"
  
  def index
    redirect_to "/home"
  end
  
  def show
    path = "/#{params[:path]}"
    @page = Page.where(path: path).first
    if @page.blank?
      @section = Section.where(path: path).first
      @page = @section.children.to_a.find { |child| child.class == Page }
    end
  end
end