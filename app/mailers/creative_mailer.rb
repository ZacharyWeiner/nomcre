class CreativeMailer < ApplicationMailer
  def creative_accepted(email)
    @email = email
     mail(to: email, subject: "You've been accepted")
  end
  def request_accepted(creative_request)
    @creative_request = creative_request
    @creative = creative_request.creative
    @shoot = @creative_request.shoot
    @project = @shoot.project
    @mail_to = creative_request.requested_by
    @url  = 'http://nomcre.com/shoots/' + "#{@shoot.id}"+"#creatives"
    mail(to: @mail_to.email, subject: "#{@creative.name} Is Available")
  end

  def request_created(creative_request)
    @creative_request = creative_request
    @creative = creative_request.creative
    @shoot = @creative_request.shoot
    @project = @shoot.project
    @company = creative_request.company
    @url  = 'http://nomcre.com/requests'
    mail(to: @creative.email, subject: "#{@company.name} Requested Your Skills")
  end
end
