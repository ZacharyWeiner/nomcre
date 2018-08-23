class CreativeMailer < ApplicationMailer
  def creative_accepted(email)
    @email = email
     mail(to: email, subject: "You've been accepted")
  end
end
