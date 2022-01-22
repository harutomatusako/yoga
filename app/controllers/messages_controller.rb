class MessagesController < ApplicationController
   before_action :authenticate_user!

 def create
   if RoomUser.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
     @message = Message.create(message_params)
     @room=@message.room
     @roommembernotme=RoomUser.where(room_id: @room.id).where.not(user_id: current_user.id)
      @theid=@roommembernotme.find_by(room_id: @room.id)
      notification = current_user.active_notifications.new(
       room_id: @room.id,
       message_id: @message.id,
       visited_id: @theid.user_id,
       visitor_id: current_user.id,
       action: 'dm'
      )
            # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end

      # すでにmessageがある場合は通知ずみとする.
      if current_user.passive_notifications.where(checked: nil, room_id: @room.id).present?
        notification.checked = true
      end

      notification.save if notification.valid?

     redirect_to room_path(@message.room_id)
   else
     flash[:alert] = "メッセージの送信に失敗しました。"
   end
 end

 private
 def message_params
   params.require(:message).permit(:user_id, :room_id, :text).merge(user_id: current_user.id)
 end
end
