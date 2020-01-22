class Email < ApplicationRecord
  belongs_to :email_template
  has_many :email_details
end
