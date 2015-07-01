class PagesController < ApplicationController
  layout "layouts/templates/default"
  
  def index
    redirect_to "/home"
  end
  
  def show
    path = "/#{params[:path]}"
    @page = Page.where(path: path).first
  end
end