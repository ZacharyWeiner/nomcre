class PackageType < ApplicationRecord
  #belongs_to
  belongs_to :header_image

  #has_one
  #has_many
  has_many :projects

  #scopes


  #mount
  mount_uploader :description_image, PackageImageUploader
  mount_uploader :example_image, PackageImageUploader
  mount_uploader :example_video_thumbnail, PackageImageUploader


  def default_template
    default_template = self.projects.where(is_default_template: true).first
    if default_template.nil?
      default_template  = self.projects.where(is_template: true).first
    end
    default_template
  end

end
