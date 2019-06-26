class LandingPagesController < ApplicationController
  layout 'landing_page'

  def marketing
    @lead = Lead.new
  end

  def thank_you
  end

  def linkedin
    render layout: 'khaki'
  end

  def headshots
    render layout: 'khaki'
  end
end
