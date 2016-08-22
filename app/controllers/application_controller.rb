class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def track_activity(trackable, action = params[:action])
    current_user.activities.create! action: action, trackable: trackable
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :username ## add the attributes you want to permit
    devise_parameter_sanitizer.for(:sign_up) << :username ## add the attributes you want to permit
  end

end
