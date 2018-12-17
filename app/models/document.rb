class Document < ApplicationRecord
  #belongs_to
  belongs_to :shoot, optional: true
  belongs_to :proposal, optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true
  belongs_to :assistant, optional: true

  #has_many

  #has_one
  has_one :project, through: :shoot

  #uploaders
  mount_uploader :file, DisclosureUploader
  mount_uploader :media, VideoUploader




  #helper methods
  def self.create_document_for_shoot shoot_id
    shoot = Shoot.find(shoot_id)
    Document.create!(shoot: shoot,
                     user: shoot.project.company.users.first,
                     title: DateTime.now.to_s + "Document Test")
  end
end
