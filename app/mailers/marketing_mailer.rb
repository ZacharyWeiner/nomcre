class MarketingMailer < ApplicationMailer
  layout 'marketing_mailer'
  def newsletter
    if params[:user]
      @user = params[:user]
    else
      @user = User.first
    end
    mail(to: 'test-5esq3@mail-tester.com', subject: '365 Days of Content in Just 5 Clicks')
    mail(to: 'zack@nomcre.com', subject: '365 Days of Content in Just 5 Clicks')
  end
end
