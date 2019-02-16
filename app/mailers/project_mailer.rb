class ProjectMailer < ApplicationMailer
  #TODO: Create UI For this Mailer
  def deposit_received(project)
    @project = project
    @user = project.company.users.first
    @url  = 'http://nomcre.com/project/' + "#{project.id}"
    mail(to: @user.email, subject: "Your Deposit for #{@project.title} Has Been Received!")
  end

  def balance_received(project)
    @project = project
    @user = project.company.users.first
    @url  = 'http://nomcre.com/project/' + "#{project.id}"
    mail(to: @user.email, subject: "Your Balance Payment For #{@project.title} Has Been Received!")
  end
end
