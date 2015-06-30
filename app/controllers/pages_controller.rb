class PagesController < ApplicationController
  layout "layouts/templates/default"
  def index
    redirect_to page_path("/")
  end
  
  def show
    @page = Page.where(path: "/").first
  end
end