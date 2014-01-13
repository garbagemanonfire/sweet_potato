class RetreatregsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @user = User.find(params[:retreatregs][:event_id])
    current_user.engage!(@event)
    redirect_to @user
  end

  def destroy
    @user = Retreatregs.find(params[:id]).engaged
    current_user.disengage!(@user)
    redirect_to @user
  end
end