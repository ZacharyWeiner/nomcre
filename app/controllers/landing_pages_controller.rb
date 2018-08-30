class LandingPagesController < ApplicationController
  layout 'landing_page'

  def marketing
    @lead = Lead.new
  end

  def thank_you
  end
end
