class FileOrVideoValidator < ActiveModel::Validator
  def validate(record)
    unless Rails.env.test?
      if defined? record.video
        if record.file.file.nil? && record.video.file.nil?
          record.errors[:base] << "You Must Upload either a File or Video"
        end
      elsif defined? record.media
        if record.file.file.nil? && record.media.file.nil?
          record.errors[:base] << "You Must Upload either a File or Video"
        end
      end
    end
  end
end

class DocumentHasAFieldValidator < ActiveModel::Validator
  def validate(record)
   if record.shoot.nil? && record.proposal.nil? && record.user.nil? && record.company.nil? && record.assistant.nil?
      record.errors[:base] << "A Document Must belong to some other object"
   end
  end
end


class Document < ApplicationRecord

  validates_with FileOrVideoValidator
  validates_with DocumentHasAFieldValidator
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
                     title: DateTime.now.to_s + "Document Test",
                     file: {file:'http://www.google.com/iamge2.png'})
  end
end
