class EventsController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  def new
    @event = Event.new
  end

  def index
    @events = Event.order(sort_column + " " + sort_direction)
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
      render 'new' #should be edit?
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :address_1, :address_2, :state, :zip_code, :e_id, :organizer_id, 
                                    :venue, :restrictions, :tradition, :description, :preparations, :instructions,
                                    :code_conduct, :comments, :capacity, :start_date, :end_date)
    end

    def sort_column
      Event.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end


end

