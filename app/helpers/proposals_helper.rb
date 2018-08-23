module ProposalsHelper


  #Proposal Requests
  def has_user_request user_id
    request = self.proposal_requests.where(requested: user_id).first
    request != nil
  end

  def request_accepted user_id
    result = false
    request = self.proposal_requests.where(requested: user_id).first
    if request && request.accepted
      result = true
    end
    result
  end

end
