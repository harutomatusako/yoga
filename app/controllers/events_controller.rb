class EventsController < ApplicationController
  def index
  end

  def new
    @event=Event.new
    
  end

  def create
    @event = Event.new(event_params)
    @event.user_id=current_user.id
    if @event.save
      redirect_to event_path(@event.id)
    else
    　render :new_event
    end
  end

  def update
  end

  def show
  end

  def edit
  end
  
  
def event_params
    params.require(:event).permit(:user_id, :title, :detail, :image, :date_from, :date_to, :location, :city, :park)
end
end
