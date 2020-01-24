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
    set_creator_header_image
  end
  def creative_showcase
    set_showcase_header_image
    @showcase_images = ShowcaseImage.where(show: true).where(showcase_type: 'main').order(:order)
  end
  def video_showcase
    set_showcase_header_image
    @showcase_videos = ShowcaseVideo.where({showcase_type: 'Main', show: 'true'}).order(:order).page params[:page]
  end
  def model_showcase
    set_showcase_header_image
    @showcase_videos = ShowcaseVideo.where(showcase_type: 'Model').order(:order).page params[:page]
  end

  def contact
    @contact = Contact.new
  end

  def about
    # @twilio_number = ENV['TWILIO_NUMBER']
    # account_sid = ENV['TWILIO_ACCOUNT_SID']
    # @client = Twilio::REST::Client.new account_sid, ENV['TWILIO_CLIENT_ID']
    # time_str = ((Time.now).localtime).strftime("%I:%M%p on %b. %d, %Y")
    # reminder = "Hi Zack. Just a reminder that you have an appointment coming up at #{time_str}."
    # message = @client.api.account.messages.create(
    #   :from => @twilio_number,
    #   :to => '19546461240',
    #   :body => reminder,
    # )
  end

  def featured_creatives
  end

  def proposal_tutorial_creative
    @lat = request.location.latitude
    @long = request.location.longitude
  end

  def proposal_tutorial_company
  end

  def tos
  end

  def thew
  end

  def explainer
  end

  def pricing
  end

  def sales_materials
  end

  def faq
  end

  def playground
  end

  def continual_content
    @lead = Lead.new
    render :layout => 'landing_page'

  end
  def noodles_email
    render layout: false
  end


  def set_showcase_header_image
    @header_images = HeaderImage.all.where(showcase: true)
    count = @header_images.count
    random = Random.new
    index_to_use = rand(count)
    @header_image = @header_images[index_to_use]
  end
  def set_creator_header_image
    @header_images = HeaderImage.all.where(creators: true)
    count = @header_images.count
    random = Random.new
    index_to_use = rand(count)
    @header_image = @header_images[index_to_use]
  end
end
