class Location < ApplicationRecord

  belongs_to :parent, class_name: 'Location', foreign_key: 'parent_id', optional: true
  has_many :children, class_name: 'Location', foreign_key: 'parent_id'
  has_many :schedule_items
  has_many :shoots

  def parent
    parent = nil
    if self.parent_id != nil
      parent = Location.find(self.parent_id)
    end
    return parent
  end

  #TODO: Turn this into a reach controller by returning a hsh, and responding to the parent selector
  def self.locations_for_select
    regions  = Location.where(location_type: 'Region')
    countries = Location.where(location_type: 'Country').collect{|l| [l.name, l.id]}
    cities = Location.where(location_type: 'City').collect{|l| [l.name, l.id]}
    options = []
    regions.each do |region|
      options << ["#{region.name}", "#{region.id}"]
      region_countries = Location.where(parent_id: region.id)
      region_countries.each do |country|
        options << ["#{region.name} : #{country.name}", "#{country.id}"]
        country_cities = Location.where(parent_id: country.id)
        country_cities.each do |city|
          options << ["#{region.name} : #{country.name} : #{city.name}", "#{city.id}"]
        end
      end
    end
    return options
  end

  #TODO: Fix This
  def self.location_names_by_region
    regions  = Location.where(location_type: 'Region')
    # countries = Location.where(location_type: 'Country').collect{|l| [l.name, l.id]}
    # cities = Location.where(location_type: 'City').collect{|l| [l.name, l.id]}
    #options = []
    @string_for_show = "<div class='row'>"

    regions.each do |region|
      @string_for_show += '<div class="col-md-3">'
      #options << ["#{region.name}", "#{region.id}"]
      @string_for_show += "<h4><b>#{region.name}</b></h4>"
      region_countries = Location.where(parent_id: region.id)
      region_countries.each do |country|
        #options << ["#{region.name} : #{country.name}", "#{country.id}"]
        @string_for_show = @string_for_show + "<span style='padding:6px;'></span>" + "<b>#{country.name}</b>" + "<br>"
        country_cities = Location.where(parent_id: country.id)
        country_cities.each do |city|
          @string_for_show = @string_for_show + "<span style='padding:6px;'></span><span  style='padding:6px;'></span>" + city.name + "<br>"
          #options << ["#{region.name} : #{country.name} : #{city.name}", "#{city.id}"]
        end
        @string_for_show += "<br/>"
      end
      @string_for_show += "</div>"
    end
    @string_for_show += "</div>"
    return @string_for_show
  end

  def self.create_default_for_tests
    @location = Location.first
    if @location.nil?
      @location = Location.create!(name: "Chicago - Test", location_type: "City")
      @location = Location.create!(name: "Miami - Test", location_type: "City")
    end
    @location
  end
end
