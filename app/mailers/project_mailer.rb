class ProjectMailer < ApplicationMailer
  def deposit_received(project)
    @project = project
    @user = project.company.users.first
    @url  = 'http://nomcre.com/project/' + "#{project.id}"
    mail(to: @user.email, subject: 'Your Deposit Has Been Received!')
  end

  def balance_received(project)
    @project = project
    @user = project.company.users.first
    @url  = 'http://nomcre.com/project/' + "#{project.id}"
    mail(to: @user.email, subject: 'Your Balance Payment Has Been Received!')
  end
end
