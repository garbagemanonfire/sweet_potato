# Controller for the application
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    session[:user_return_to] || events_path
  end

  def set_return_path
    unless devise_controller? || request.xhr? || !request.get?
      session[:user_return_to] = request.url
    end
  end
end
