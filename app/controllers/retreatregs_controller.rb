class RetreatregsController < ApplicationController

  before_filter :authenticate_user!

  def update
    @event = Event.find(params[:id])
    current_user.engage!(@event)
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:id])
    current_user.disengage!(@event)
    redirect_to @event
  end
end