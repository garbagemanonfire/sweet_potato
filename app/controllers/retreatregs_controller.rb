class RetreatregsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @event = Event.find(params[:retreatreg][:event_id])
    current_user.engage!(@event)
    redirect_to @event
  end

  def update
    @event = Event.find(params[:event_id])
    current_user.engage!(@event)
    redirect_to @event
  end

  def destroy
    @event = Retreatreg.find(params[:id]).event
    current_user.disengage!(@event)
    redirect_to @event
  end

  private

  def event_params
      params.require(:id).permit(:title, :address_1, :address_2, :state, :zip_code, :e_id, :organizer_id, 
                                    :venue, :restrictions, :tradition, :description, :preparations, :instructions,
                                    :code_conduct, :comments, :capacity, :start_date, :end_date)
  end
end