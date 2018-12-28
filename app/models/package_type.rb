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


  def create_project user, deadline
    project_template = self.projects.where(is_default_template: true).first
    if project_template.nil?
      project_template = self.projects.where(is_template: true).first
    end
    p "Project Template is nil? #{project_template.nil?}"
    p "Project Template is  #{project_template.id}"
    # begin
     new_project = Project.create_from_template user.company.id, self.id, deadline
    # rescue
    #   new_project = Project.new
    # ensure
    #   p "This is for clean up on create_project"
    # end
  end

end
