class Task < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :proposal

  def approver
    if self.can_accept == 'creative'
      return user
    else
      return company.users.first
    end
  end
end
