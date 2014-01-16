class RetreatregsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    current_user.engage!(@event)
    redirect_to @event
  end

  def destroy
    @event = Retreareg.find(params[:id])
    current_user.disengage!(@event)
    redirect_to @event
  end
end