module Grantox
  class PagesController < ApplicationController
    def index
      redirect_to "/cms/home"
    end
  
    def show
      path = "/#{params[:path]}"
      @page = Page.where(path: path).first
      if @page.blank?
        @section = Section.where(path: path).first
        @page = @section.children.to_a.find { |child| child.class == Page }
      end
    
      render layout: "layouts/grantox/templates/#{@page.template_file_name}"
    end
    
    def publish
      @page = Page.find(params[:id])
      @page.touch
      @page.save
      redirect_to @page.path
    end
  
    def new
      @section_id         = params[:section_id]
      @selected_section   = Section.find(@section_id)
      @page               = Page.new
      @page.path          = @selected_section.path
    end
  
    def edit
      @page = Page.find(params[:id])
    end
  
    def update
      @page = Page.find(params[:id])
      @page.update(page_params)
      redirect_to @page.path
    end
  
    def destroy
      @page = Page.find(params[:id])
      @page.destroy
      redirect_to nodes_path
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
end