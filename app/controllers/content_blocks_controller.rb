class ContentBlocksController < ApplicationController
  prepend_view_path 'app/views/connectables'
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
    @content_block  = params[:controller].singularize.classify.constantize.new
  end
  
  def edit
  end
  
  def update
    @content_block.update_attributes(content_block_params)
    redirect_to "/"
  end
  
  def create
    @content_block = params[:controller].singularize.classify.constantize.create(content_block_params)
    
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
    @content_block = params[:controller].singularize.classify.constantize.find(params[:id])
  end
  
  def content_block_params
    params.require(params[:controller].singularize.to_sym).permit!
  end
end