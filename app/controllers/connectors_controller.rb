class ConnectorsController < ApplicationController
  before_action :find_connectors
  
  def destroy
    @connector.destroy
    redirect_to :back
  end
  
  private
  
  def find_connectors
    @connector = Connector.find(params[:id])
  end
end