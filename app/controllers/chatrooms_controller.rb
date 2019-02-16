class ChatroomsController < ApplicationController
  layout 'chatroom'
  def show
    #get other chatrooms for menu
    @menu_rooms = nil
    if current_user.user_type == UserType.creative
      @menu_rooms = current_user.chatrooms
    elsif current_user.user_type == UserType.company
      @menu_rooms = current_user.company.chatrooms
    elsif current_user.is_admin
      @menu_rooms = Chatroom.all.reverse
    end

    #Set Up This Chatroom
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    #clear notifications for room
    #TODO: Create a helper for clearing relevant notifications
    notifications = Notification.where(user: current_user, notification_type: "New Message", notification_object_id: params[:id], read:false)
    notifications.each do |note|
      note.read = true
      note.save
    end
  end
end

