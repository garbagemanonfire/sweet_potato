class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def engaging
    @title = "Engaging"
    @user = User.find(params[:id])
    @events = @user.events
    render 'show_engage'
  end
end
