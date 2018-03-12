class ChatroomsController < ApplicationController
  layout 'chatroom'
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    if current_user.user_type == "creative"
      @proposals = current_user.proposals.where('deadline > ?', Date.today - 14.days )
    else
      @proposals = current_user.company.proposals.where('deadline > ?', Date.today - 14.days )
    end
    notifications = Notification.where(user: current_user, notification_type: "New Message", notification_object_id: params[:id], read:false)
    notifications.each do |note|
      note.read = true
      note.save
    end
  end
end
