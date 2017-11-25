class KhakiController < ApplicationController
  require 'twilio-ruby'
  layout 'khaki'
  def index
  end

  def nomcre_home
  end

  def nomcre_process
  end

  def creative_landing
  end
  def creative_showcase
  end

  def contact
    @contact = Contact.new
  end

  def about
    @twilio_number = '19545162345'
    account_sid = 'AC13e2dae35223ccb60942cabc681a1b51'
    @client = Twilio::REST::Client.new account_sid, '25fb357eb1d1c06b4cf1ba9114bfb290'
    time_str = ((Time.now).localtime).strftime("%I:%M%p on %b. %d, %Y")
    reminder = "Hi Zack. Just a reminder that you have an appointment coming up at #{time_str}."
    message = @client.api.account.messages.create(
      :from => @twilio_number,
      :to => '19546461240',
      :body => reminder,
    )
  end

  def featured_creatives
  end
end
