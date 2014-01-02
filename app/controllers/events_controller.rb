class EventsController < ApplicationController
  
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
       flash[:success] = "Your retreat has been added!"
      redirect_to @event
    else
      render 'new'
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :address_1, :address_2, :state, :zip_code, :e_id, :organizer_id, 
                                    :venue, :restrictions, :tradition, :description, :preparations, :instructions,
                                    :code_conduct, :comments, :capacity, :start_date, :end_date)
    end

end

