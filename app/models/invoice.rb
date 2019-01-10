class Invoice < ApplicationRecord
  #belongs_to
  belongs_to :project
  belongs_to :company
  belongs_to :payment, optional: true

  #has_one
  #has_many

  #instance_methods
  def is_paid
    self.payment.nil? ? false : true
  end
  #class_methods

  #helpers
  def self.create_for_project project_id
    @invoices = []
    project = Project.find(project_id)
    amount = !project.price.nil? ? project.price : 15000


    @invoices << Invoice.create!(project: project,
                    company: project.company,
                    amount: (amount / 2),
                    invoice_type: 'deposit')


    @invoices << Invoice.create!(project: project,
                    company: project.company,
                    amount: amount / 2,
                    invoice_type: 'balance')

    @invoices
  end

end
