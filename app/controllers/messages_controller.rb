class MessagesController < ApplicationController
  before_action :authenticate_user!
  #TODO: Test this implementation of authorize below
  #before_action :authorize
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      message.chatroom.users.uniq.each do |user|
        notification = Notification.where(user: user, notification_type: "New Message", notification_object_id: message.chatroom.id).first
        if notification.nil?
          notification = Notification.create!(user: user, notification_type: "New Message", notification_object_id: message.chatroom.id, read: false)
        else
          notification.read = false
          notification.save
        end
      end
      redirect_to chatroom_path(message.chatroom) and return
    else
      redirect_to chatrooms_path
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chatroom_id, :file)
    end

    # def authorize
    #   if Chatroom.find(message_params[chatroom_id:]).users.include?(current_user)
    #     return
    #   end
    #   redirect_to chatrooms_path
    # end
end
