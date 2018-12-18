class CreativeRequest < ApplicationRecord
  #belongs_to
  belongs_to :shoot
  belongs_to :company
  belongs_to :creative, class_name: 'User', foreign_key: 'creative_id'
  belongs_to :requested_by, class_name: 'User', foreign_key: 'requested_by_id'


  #helpers
  def self.create_for_shoot shoot_id, creative_id
    request = CreativeRequest.new
    shoot = Shoot.find(shoot_id)
    request.shoot_id = shoot.id
    request.requested_by_id = shoot.company.users.first.id
    request.company_id = shoot.company.id
    request.creative_id = creative_id
    request.save!
  end


end
