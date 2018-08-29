class LandingPagesController < ApplicationController
  layout 'khaki'

  def marketing
    @lead = Lead.new
  end
end
