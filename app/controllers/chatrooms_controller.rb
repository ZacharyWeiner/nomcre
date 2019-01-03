class ChatroomsController < ApplicationController
  layout 'chatroom'
  def show
    #get other chatrooms for menu
    @menu_rooms = nil
    if current_user.user_type == UserType.creative
      @menu_rooms = current_user.chatrooms
    elsif current_user.user_type == UserType.company
      @menu_rooms = current_user.company.shoots.where('deadline > ?', Date.today - 30.days).where.not(creative: nil)
    end

    #Set Up This Chatroom
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    #clear notifications for room
    notifications = Notification.where(user: current_user, notification_type: "New Message", notification_object_id: params[:id], read:false)
    notifications.each do |note|
      note.read = true
      note.save
    end
  end
end

