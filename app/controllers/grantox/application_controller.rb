module Grantox
  class ApplicationController < ActionController::Base
    def visual_edit
      session[:visual_edit]
    end
    helper_method :visual_edit
    
    def preview
      params[:preview]
    end
    helper_method :preview

    def visual_edit_mode
      session[:visual_edit] = (params[:state] == "on")
      redirect_to :back
    end
  end
end
