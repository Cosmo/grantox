module Grantox
  class SectionsController < ApplicationController
    def new
      @section_id         = params[:section_id]
      @selected_section   = Section.find(@section_id)
      @section            = Section.new
      @section.path       = @selected_section.path
    end
  
    def edit
      @section = Section.find(params[:id])
    end
  
    def update
      @section = Section.find(params[:id])
      @section.update(section_params)
      redirect_to nodes_path
    end
  
    def destroy
      @section = Section.find(params[:id])
      @section.destroy
      redirect_to nodes_path
    end
  
    def create
      @section                    = Section.new(section_params)
      @section_id                 = params[:section_id]
      @selected_section           = Section.find(@section_id)
      @selected_section.children  << @section
      redirect_to nodes_path
    end
  
    def section_params
      params.require(:section).permit!
    end
  end
end
