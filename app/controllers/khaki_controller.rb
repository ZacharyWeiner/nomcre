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
end
