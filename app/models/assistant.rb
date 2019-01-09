class Assistant < ApplicationRecord

  validates :name,            presence: true, case_sensitive: false
  validates :phone,           presence: true, case_sensitive: false
  validates :paypal_email,    presence: true, case_sensitive: false
  validates :rate,            presence: true
  validates :assistant_type,  presence: true, case_sensitive: false
  validates :location,        presence: true
  validates :shoot_id,        presence: true, case_sensitive: false

  #belongs_to
  belongs_to :location, optional: true
  belongs_to :proposal, optional: true
  belongs_to :shoot,    optional: true

  #has_one

  #has_many
  has_many :documents


  #helpers
  def self.create_for_shoot (options = {})

    assistant_name = options[:name].nil?            ? "Assistant " + Assistant.all.count.to_s
                                                    : options[:name]

    assistant_email = options[:email].nil?          ? assistant_name + '@gmail.com'
                                                    : options[:email]

    assistant_phone = options[:phone].nil?          ? '1-800-999-8888 ext.' + Assistant.all.count.to_s
                                                    : options[:phone]

    assistant_rate = options[:rate].nil?            ? 100
                                                    : options[:rate]

    assistant_type = options[:type].nil?            ? 'General'
                                                    : options[:type]

    assistant_location = options[:location_id].nil? ? Location.first
                                                    : options[:location_id]

    assistant = Assistant.create!(name: assistant_name,
                                  paypal_email: assistant_email,
                                  phone: assistant_phone,
                                  assistant_type: assistant_type,
                                  rate: assistant_rate,
                                  shoot_id: options[:shoot_id],
                                  location_id: assistant_location)
    assistant
  end
end

