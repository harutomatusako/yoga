class EventsController < ApplicationController

  def index
    @events=Event.where('date_from >= ?', Date.today)
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

  def search
    content = params[:content]
    @event = Event.locations.find {|key, value| key.match(/#{content}/)}
    if @event.blank?
     @events = Event.where('date_from >= ?', Date.today)
    else
     location_enum = @event[1]
    @events = Event.where(location: location_enum).where('date_from >= ?', Date.today)
    end
    render :index
  end

  private
  def search_for(content)
    Event.where(name: content)
  end


 def event_params
    params.require(:event).permit(:user_id, :title, :detail, :image, :date_from, :date_to, :location, :city, :park)
 end
end
