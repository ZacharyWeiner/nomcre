class Location < ApplicationRecord
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
end
