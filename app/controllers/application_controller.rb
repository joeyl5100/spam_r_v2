class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD
  before_action :authenticate_user!, :except => [:messages_path]
=======
  #This line has been commented out due to issues with it redirecting - disallowing the admin from logging in successfully 
  #before_action :authenticate_user!, :accept => [:admin_users, :admin]
>>>>>>> 6f420c07957d4b6b7c9bfe109f2b3cc0242c9c4a

def after_sign_in_path_for(resource)
    root_path
end

end
