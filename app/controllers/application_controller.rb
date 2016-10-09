class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :store_current_location, :unless => :devise_controller?
  before_filter :store_location

  protect_from_forgery with: :exception

  def track_activity(trackable, action = params[:action])
    if trackable == @event
      current_user.activities.create! action: action, trackable: trackable, esdate: trackable.esdate, eedate: trackable.eedate
    elsif trackable == @foldate
      current_user.activities.create! action: action, trackable: trackable, datefolwd: trackable.datefolwd
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:username]) ## add the attributes you want to permit
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username]) ## add the attributes you want to permit
  end

  private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:user, request.url)
  end

  def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get?
  if (request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath
  end
end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end

end
