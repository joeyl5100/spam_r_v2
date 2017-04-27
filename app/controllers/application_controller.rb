class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :set_categories
  
  private

  def set_categories
      if (params[:tag] == NIL)
        @results = Message.all
      else
        @results = Message.tagged_with(params[:tag])
      end
  end
end
 
  #def after_sign_in_path_for(resource)
  #root_path # unless current_admin_user
  #end
