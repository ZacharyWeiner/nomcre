class ProposalMailer < ApplicationMailer
  def deposit_received(proposal)
    @proposal = proposal
    @user = proposal.company.users.first
    @url  = 'http://nomcre.com/proposals/' + "#{proposal.id}"
    mail(to: @user.email, subject: 'Your Deposit Has Been Recieved!')
  end
end
