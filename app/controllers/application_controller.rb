# Controller for the application
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private 

  def after_sign_in_path_for(resource)
    session[:user_return_to] || events_path
  end

end
