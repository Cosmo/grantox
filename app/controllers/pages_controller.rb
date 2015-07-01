class PagesController < ApplicationController
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
    
    render layout: "layouts/templates/#{@page.template_file_name}"
  end
  
  def new
    @section_id         = params[:section_id]
    @selected_section   = Section.find(@section_id)
    @page               = Page.new
    @page.path          = @selected_section.path
    @templates          = Dir["#{Rails.root}/app/views/layouts/templates/**/*.html.erb"].map { |m| File.basename(m, ".*") }
  end
  
  def create
    @page                       = Page.new(page_params)
    @section_id                 = params[:section_id]
    @selected_section           = Section.find(@section_id)
    @selected_section.children  << @page
    redirect_to @page.path
  end
  
  def page_params
    params.require(:page).permit!
  end
end