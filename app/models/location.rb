class Location < ApplicationRecord
  has_and_belongs_to_many :tags


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

  def self.location_names_by_region
    regions  = Location.where(location_type: 'Region')
    # countries = Location.where(location_type: 'Country').collect{|l| [l.name, l.id]}
    # cities = Location.where(location_type: 'City').collect{|l| [l.name, l.id]}
    #options = []
    @string_for_show = ""
    regions.each do |region|

      #options << ["#{region.name}", "#{region.id}"]
      @string_for_show = @string_for_show + region.name + "<br>"
      region_countries = Location.where(parent_id: region.id)
      region_countries.each do |country|
        #options << ["#{region.name} : #{country.name}", "#{country.id}"]
        @string_for_show = @string_for_show + "<span style='padding:6px;'></span>" + country.name + "<br>"
        country_cities = Location.where(parent_id: country.id)
        country_cities.each do |city|
          @string_for_show = @string_for_show + "<span style='padding:6px;'></span><span  style='padding:6px;'></span>" + city.name + "<br>"
          #options << ["#{region.name} : #{country.name} : #{city.name}", "#{city.id}"]
        end
      end
    end
    return @string_for_show
  end
end
