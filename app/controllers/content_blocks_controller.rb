class ContentBlocksController < ApplicationController
  before_action :find_content_block
  
  def destroy
    @content_block.destroy
    redirect_to :back
  end
  
  private
  
  def find_content_block
    @content_block = params[:controller].singularize.classify.constantize.find(params[:id])
  end
end