class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def visual_edit
    session[:visual_edit]
  end
  helper_method :visual_edit
  
  def visual_edit_mode
    session[:visual_edit] = (params[:state] == "on")
    redirect_to :back
  end
end
