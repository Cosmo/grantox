module Grantox
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
    
      @connectables = ContentBlock.installed_models
      @content_blocks = ContentBlock.all
    end
    
    def move
      @connector    = Connector.find(params[:id])
      @position     = params[:position].to_i
      @connector.reorder_with_position(@position)
      render :nothing => true, :status => 200, :content_type => 'application/javascript'
    end
  
    def add
      @container        = params[:container]
      @page_id          = params[:page_id]
      @connectable_id   = params[:connectable_id]
      @connectable_type = params[:connectable_type]
      @connectable      = @connectable_type.constantize.find(@connectable_id)
    
      Connector.create(page_id: @page_id, connectable: @connectable, container: @container)
    
      redirect_to Page.find(@page_id).path
    end
  
    private
  
    def find_connectors
      @connector = Connector.find(params[:id])
    end
  end
end