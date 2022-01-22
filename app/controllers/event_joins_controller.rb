class EventJoinsController < ApplicationController
  def create
    @event_join = EventJoin.new(event_id: params[:event_id], user_id: current_user.id)
    if @event_join.save
      redirect_to user_path(current_user.id)
    else
    　#render :new_event
    end
  end

  def update
    @event_joins = EventJoin.where(event_id: params[:id], user_id: current_user.id)
    @event_joins.each do | event_join |
     event_join.update(status: "キャンセル")
    end
    redirect_to user_path(current_user.id)
  end

private
def event_joins_params
    params.require(:event_join).permit(:event_id).merge(user_id: current_user.id)
end
end
