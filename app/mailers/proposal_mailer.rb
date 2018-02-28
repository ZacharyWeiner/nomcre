class ProposalMailer < ApplicationMailer
  def deposit_received(proposal)
    @proposal = proposal
    @user = proposal.company.users.first
    @url  = 'http://nomcre.com/proposals/' + "#{proposal.id}"
    mail(to: @user.email, subject: 'Your Deposit Has Been Recieved!')
  end

  def balance_received(proposal)
    @proposal = proposal
    @user = proposal.company.users.first
    @url  = 'http://nomcre.com/proposals/' + "#{proposal.id}"
    mail(to: @user.email, subject: 'Your Balance Has Been Recieved!')
  end

  def request_accepted(proposal_request)
    @proposal_request = proposal_request
    @creative = User.find(proposal_request.requested)
    @proposal = @proposal_request.proposal
    @mail_to = User.find(proposal_request.requested_by)
    @url  = 'http://nomcre.com/proposals/' + "#{@proposal.id}"
    mail(to: @mail_to.email, subject: "#{@creative.name} Is Available")
  end

  def request_created(proposal_request)
    @proposal_request = proposal_request
    @creative = User.find(proposal_request.requested)
    @proposal = @proposal_request.proposal
    @company = User.find(proposal_request.requested_by)
    @url  = 'http://nomcre.com/requests'
    mail(to: @creative.email, subject: "#{@company.name} Requested Your Skills")
  end

  def proposal_assigned(proposal_request)
    @proposal = proposal_request.proposal
    @user = @proposal.company.users.first
    @company = @proposal.company
    @creative = @proposal.user
    @url  = 'http://nomcre.com/proposals/' + "#{@proposal.id}"
    mail(to: @user.email, subject: "You've got new work on NomCre")
  end
end
