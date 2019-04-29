
class DateHelper
  include ActiveModel::AttributeMethods

  def self.parse_date params_string
    date_string = params_string
    split_string = date_string.split(' ')
    format_string = "day-month-year"
    date_split = split_string[0].split('/')
    #new_date_obj = Date.new( date_split[1].to_i, date_split[0].to_i,  date_split[2].to_i)
    #@proposal.deadline = Date.new(split_string[0])
    new_date_string = format_string.gsub('day', date_split[1]).gsub('month', date_split[0]).gsub('year', date_split[2])
    new_date = Date::strptime(new_date_string, "%d-%m-%Y")
    return new_date
  end

  def self.parse_date_month_first params_string
    date_string = params_string
    split_string = date_string.split(' ')
    format_string = "day-month-year"
    date_split = split_string[0].split('/')
    #new_date_obj = Date.new( date_split[1].to_i, date_split[0].to_i,  date_split[2].to_i)
    #@proposal.deadline = Date.new(split_string[0])
    new_date_string = format_string.gsub('day', date_split[1]).gsub('month', date_split[0]).gsub('year', date_split[2])
    new_date = Date::strptime(new_date_string, "%d-%m-%Y")
    return new_date
  end

  def self.parse_date_year_first params_string
    date_string = params_string
    split_string = date_string.split(' ')
    format_string = "day-month-year"
    date_split = split_string[0].split('/')
    #new_date_obj = Date.new( date_split[1].to_i, date_split[0].to_i,  date_split[2].to_i)
    #@proposal.deadline = Date.new(split_string[0])
    new_date_string = format_string.gsub('day', date_split[2]).gsub('month', date_split[1]).gsub('year', date_split[0])
    new_date = Date::strptime(new_date_string, "%d-%m-%Y")
    return new_date
  end
end
