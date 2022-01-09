class EventsController < ApplicationController

  def index
    @events=Event.all
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
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event.id)
  end

  def show
    @event=Event.find(params[:id])
    @user = @event.user
    @event_join = EventJoin.find_by(user: current_user, event: @event) || EventJoin.new
    @events = Event.all
  end

  def edit
    @event=Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end


 def event_params
    params.require(:event).permit(:user_id, :title, :detail, :image, :date_from, :date_to, :location, :city, :park)
 end
end
