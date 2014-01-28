# Controller for user has engaging method for retreat.
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def engaging
    @title = 'Engaging'
    @user = User.find(params[:id])
    @events = @user.events.order(sort_column + ' ' + sort_direction)
    render 'show_engage'
  end

  private

  def sort_column
    @user.events.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
