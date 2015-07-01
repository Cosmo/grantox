class ConnectorsController < ApplicationController
  before_action :find_connectors, only: [:destroy]
  
  def destroy
    @connector.destroy
    redirect_to :back
  end
  
  def new
    @container    = params[:container]
    @page_id      = params[:page_id]
    @connector    = Connector.new(container: @container, page_id: @page_id)
    @connectables = [TextContentBlock, TextWithTitleContentBlock]
  end
  
  private
  
  def find_connectors
    @connector = Connector.find(params[:id])
  end
end