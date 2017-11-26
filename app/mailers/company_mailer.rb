class CompanyMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @company = user.company
    @url  = 'http://nomcre.com/companies/' + "#{user.company.id}"
    mail(to: @user.email, subject: 'Welcome to NOMCRE')
  end
end
