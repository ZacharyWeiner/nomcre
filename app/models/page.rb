class Page < ApplicationRecord
  mount_uploader :header_image, PageImageUploader
  validates :title, presence: true, uniqueness: true
  has_many :page_sections

  def build_link(request)
    return request.base_url + '/pages/' + self.slug
  end
end
