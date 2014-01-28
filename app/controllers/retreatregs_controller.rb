# Object that creates/destroys relationship between users and events.
class RetreatregsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @event = Event.find(params[:retreatreg][:event_id])
    current_user.engage!(@event)
    flash[:success] = 'You have engaged with this retreat!'
    redirect_to @event
  end

  def destroy
    @event = Retreatreg.find(params[:id]).event
    current_user.disengage!(@event)
    flash[:success] = 'You have disengaged from the retreat!'
    redirect_to @event
  end
end
