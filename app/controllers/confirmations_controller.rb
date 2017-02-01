class ConfirmationsController < Devise::ConfirmationsController
  before_action :check_confirmation, only: :show

  def check_confirmation
    if warden.authenticate!(auth_options)
      if warden.authenticate!(auth_options).confirmed?
        super
      else
        warden.authenticate!(auth_options).resend_confirmation_instructions
      end
    end
  end

  private
  def after_confirmation_path_for(resource_name, resource)
    new_user_session_path
  end

end
