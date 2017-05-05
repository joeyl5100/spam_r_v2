class ConfirmationsController < Devise::ConfirmationsController
# define after_confirmation_path_for
  private
  def after_confirmation_path_for(resource_name, resource)
    new_user_session_path
  end
end