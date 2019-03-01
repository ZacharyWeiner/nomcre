class PackageType < ApplicationRecord
  #belongs_to
  belongs_to :header_image

  #has_one
  #has_many
  has_many :projects

  #validations
  validates :title, presence: true, case_sensitive: false
  validates :subtitle, presence: true, case_sensitive: false
  validates :description, presence: true, case_sensitive: false
  validates :max_models,  presence: true
  validates :minimum_images,  presence: true
  validates :minimum_videos,  presence: true
  validates :base_price, numericality: { other_than: 0 }

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
    new_project = nil
    project_template = self.projects.where(is_default_template: true).first
    if project_template.nil?
      project_template = self.projects.where(is_template: true).first
    end
    p "Project Template is nil? #{project_template.nil?}"
    p "Project Template is  #{project_template.id}"
    if project_template.nil?
        throw err; #This should not happen since we are calling the method from an instance of the object
    else
     new_project = Project.create_from_template user.company.id, self.id, deadline
    end
    new_project
  end

  def self.create_default_for_tests
    hi  = HeaderImage.first
    if hi.nil?
      hi = HeaderImage.create!()
    end
    PackageType.create!(header_image: hi, title: 'Default', subtitle: "default", description: 'Default', max_models: 1, minimum_images: 1, minimum_videos:1, base_price: 10000)
  end



  def self_destruct
    projects = self.projects
    projects.each do |proj|
      invoices = proj.invoices
      invoices.each do |i|
        i.destroy
      end
      payments = proj.payments
      payments.each do |pay|
        pay.destroy!
      end

      shoots = proj.shoots
      shoots.each do |shoot|
        tgs = shoot.task_groups
        tgs.each do |tg|
          tg.destroy
        end
        slis = shoot.shot_list_items
        slis.each do |sli|
          sli.destroy
        end
        tasks = shoot.tasks
        tasks.each do |task|
          task.destroy
        end
        if shoot.chatroom
          if shoot.chatroom.messages.count > 0
            messages = shoot.chatroom.messages
            messages.each do |mess|
              mess.destroy
            end
          end
          shoot.chatroom.destroy
        end
        shoot.destroy
      end
      proj.destroy
    end
    self.destroy
  end

end
