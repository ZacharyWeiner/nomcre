class ShootMailer < ApplicationMailer
  #TODO: Create UI For this Mailer
  def creative_assigned(creative_request)
    @shoot = creative_request.shoot
    @company = @shoot.company
    @creative = creative_request.creative
    @url  = 'http://nomcre.com/shoots/' + "#{@shoot.id}"
    mail(to: @creative.email, subject: "You've got a new job on Nomcre.com")
  end
end
