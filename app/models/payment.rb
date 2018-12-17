class Payment < ApplicationRecord
  #belongs_to ->
  belongs_to :user
  belongs_to :project

  #has_one ->
  has_one :company, through: :user

  #has_many ->
  has_many :invoices

end
