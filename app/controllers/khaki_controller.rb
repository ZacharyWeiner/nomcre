class KhakiController < ApplicationController
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
    @showcase_images = ShowcaseImage.where(show: true).where(showcase_type: 'main').order(:order)
  end
  def video_showcase
    @showcase_videos = ShowcaseVideo.all.order(:order)
  end

  def contact
    @contact = Contact.new
  end

  def about

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
end
