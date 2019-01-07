class Assistant < ApplicationRecord

  validates :name, presence: true, case_sensitive: false
  validates :phone, presence: true, case_sensitive: false
  validates :paypal_email, presence: true, case_sensitive: false
  validates :rate, presence: true
  validates :assistant_type, presence: true, case_sensitive: false
  validates :location, presence: true
  validates :shoot_id, presence: true, case_sensitive: false

  #belongs_to
  belongs_to :location, optional: true
  belongs_to :proposal, optional: true
  belongs_to :shoot, optional: true

  #has_one

  #has_many
  has_many :documents


  #helpers
  def self.create_for_shoot shoot_id
    assistant_count = Assistant.all.count
    assistant_name = "Assistant " + assistant_count.to_s
    assistant_email = assistant_name + '@gmail.com'
    assistant_phone = '800-999-8888 ext.' + assistant_count.to_s
    assistant_rate = 100
    assistant_type = 'General'

    assistant = Assistant.create!(name: assistant_name,
                                  paypal_email: assistant_email,
                                  phone: assistant_phone,
                                  assistant_type: assistant_type,
                                  rate: assistant_rate,
                                  shoot_id: shoot_id)

  end
end
