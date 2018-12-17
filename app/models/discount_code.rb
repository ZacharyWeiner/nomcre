class DiscountCode < ApplicationRecord
  #belongs_to
  #has_one
  #has_many
  #habtm
  has_and_belongs_to_many :projects

  #instance_methods
  #class_methods

  #helper methods
  def self.construct_initial_codes
    code_1 = DiscountCode.create(code: 'Code-1',
                                  discount_type: 'percentage',
                                  expiration_date: Date.today + 1.year,
                                  max_uses: 2,
                                  discount: 6)

    code_2 = DiscountCode.create(code: 'Code-2',
                                  discount_type: 'fixed',
                                  expiration_date: Date.today + 1.year,
                                  max_uses: 2,
                                  discount: 500)

    code_3 = DiscountCode.create(code: 'Code-3',
                                  discount_type: 'fixed',
                                  expiration_date: Date.today + 1.year,
                                  max_uses: 10,
                                  discount: 1500)

  end
end
