class EventJoinsController < ApplicationController
  def create
    @event_join = EventJoin.new(event_joins_params)
    if @event_join.save
      redirect_to users_my_page_path
    else
    　#render :new_event
    end
  end
  
private
def event_joins_params
    params.require(:event_join).permit(:event_id).merge(user_id:current_user.id)
end
end
