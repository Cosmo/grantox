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
    
    @connectables = Dir["#{Rails.root}/app/models/**/*.rb"].map { |m| File.basename(m, ".*").classify.constantize }.select { |m| m.to_s =~ /.+ContentBlock$/ }
  end
  
  private
  
  def find_connectors
    @connector = Connector.find(params[:id])
  end
end