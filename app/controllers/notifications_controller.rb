class NotificationsController < ApplicationController
  layout 'adminlte'
  def index
    @notifications = Notification.where(user: current_user).order(:created_at).reverse
    unread = Notification.where(user: current_user).where(read: false)
    unread.each do |note|
      note.read = true
      note.save
    end
  end
end
