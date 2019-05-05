class MarketingMailer < ApplicationMailer
  default from: 'zack@nomcre.com'

  def newsletter
    if params[:user]
      @user = params[:user]
    else
      @user = User.first
    end
    mail(to: @user.email, subject: 'Your Only 5 Clicks From A Year Of Content')
  end
end
