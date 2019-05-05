class MarketingMailer < ApplicationMailer
  layout 'marketing_mailer'
  def newsletter
    if params[:user]
      @user = params[:user]
    else
      @user = User.first
    end
    mail(to: @user.email, subject: 'Your Only 5 Clicks From A Year Of Content')
  end
end
