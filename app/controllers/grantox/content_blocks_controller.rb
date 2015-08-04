module Grantox
  class ContentBlocksController < ApplicationController
    before_action :find_content_block, only: [:edit, :update, :destroy]
  
    def destroy
      @content_block.connectors.destroy_all
      @content_block.destroy
      redirect_to :back
    end
  
    def index
      @content_blocks = ContentBlock.all
    end
  
    def new
      @page_id        = params[:page_id]
      @container      = params[:container]
      @content_block  = ContentBlock.model_name_from_string(params[:controller]).new
    end
  
    def edit
    end
  
    def update
      @content_block.update_attributes(content_block_params)
      redirect_to "/"
    end
  
    def create
      @content_block = ContentBlock.model_name_from_string(params[:controller]).create(content_block_params)
    
      if params[:container].present? && params[:page_id].present?
        @container  = params[:container]
        @page_id    = params[:page_id]
        @connection = Connector.create(connectable: @content_block, page_id: @page_id, container: @container)
        redirect_to Page.find(@page_id).path
      else
        redirect_to "/"
      end
    end
  
    private
  
    def find_content_block
      @content_block = ContentBlock.model_name_from_string(params[:controller]).find(params[:id])
    end
  
    def content_block_params
      params.require(params[:controller].split("/").last.singularize.to_sym).permit!
    end
  end
end