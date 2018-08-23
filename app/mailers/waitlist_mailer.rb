class WaitlistMailer < ApplicationMailer
  def joined_waitlist(email)
    @email = email
    mail(to: email, subject: "You're on the waitlist")
  end
end
