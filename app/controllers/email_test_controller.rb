class EmailTestController < ApplicationController
  def property_management
  end

  def modeling_agency
  end

  def newsletter
    MarketingMailer.with(user: User.first).newsletter.deliver_now!
    redirect_to root_path
  end
end
