class Lead < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
  require 'activerecord-import/active_record/adapters/postgresql_adapter'
  has_many :lead_notes
  paginates_per 10


  def self.import_file(file)
    leads = []
    CSV.foreach(file.path, headers: true) do |row|
      leads << Lead.new(row.to_h)
    end
    Lead.import leads, recursive: true

    Lead.all.each do |lead|
      if lead.name.blank?
        lead.name = lead.first_name + " " + lead.last_name
      end
      if lead.office_phone.blank? && !lead.phone.blank?
        lead.office_phone = lead.phone
      end
      if lead.last_contacted.blank? && !lead.visit_time.blank?
        lead.last_contacted = DateHelper.parse_date_year_first lead.visit_time
        lead.next_contact = Date.today + 14.days
      else
        lead.next_contact = Date.today + 14.days
      end
      lead.save!
    end
  end

end
