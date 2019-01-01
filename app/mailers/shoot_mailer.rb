class ShootMailer < ApplicationMailer
  #TODO: Create UI For this Mailer
  def request_accepted(creative_request)
    @creative_request = creative_request
    @creative = User.find(creative_request.requested)
    @proposal = @creative_request.shoot
    @mail_to = User.find(shoot_request.requested_by)
    @url  = 'http://nomcre.com/shoots/' + "#{@shoot.id}"
    mail(to: @mail_to.email, subject: "#{@creative.name} Is Available")
  end

  def request_created(creative_request)
    @creative_request = creative_request
    @creative = User.find(creative_request.requested)
    @shoot = @creative_request.shoot
    @company = User.find(creative_request.requested_by)
    @url  = 'http://nomcre.com/requests'
    mail(to: @creative.email, subject: "#{@company.name} Requested Your Skills")
  end

  def shoot_assigned(creative_request)
    @shoot = creative_request.shoot
    @creative = User.find(creative_request.creative_id)
    @url  = 'http://nomcre.com/shoots/' + "#{@shoot.id}"
    mail(to: @creative.email, subject: "You've got new work on NomCre")
  end
end
