class Task < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :proposal

  def approver
    if company.nil?
      return user
    else
      return company.users.first
    end
  end
end
