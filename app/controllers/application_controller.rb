# Controller for the application
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :sort_column, :sort_direction

  private

  def after_sign_in_path_for(resource)
    session[:user_return_to] || events_path
  end

  def set_return_path
    unless devise_controller? || request.xhr? || !request.get?
      session[:user_return_to] = request.url
    end
  end

  def sort_column
    Event.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
