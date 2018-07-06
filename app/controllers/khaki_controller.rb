class KhakiController < ApplicationController
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

  def faq
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
