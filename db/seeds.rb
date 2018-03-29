# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


north_america = Location.create!(name: "North America", location_type: 'Region')
usa = Location.create!(name: "United States", location_type: 'Country', parent_id: north_america.id)
nyc = Location.create!(name: "New York City", location_type: 'City', parent_id: usa.id)
chicago = Location.create!(name: "Chicago", location_type: 'City', parent_id: usa.id)
la = Location.create!(name: "Los Angeles", location_type: 'City', parent_id: usa.id)
miami  = Location.create!(name: "Miami", location_type: 'City', parent_id: usa.id)


mexico = Location.create!(name: "Mexico", location_type: 'Country',  parent_id: north_america.id)
cdmx  = Location.create!(name: "Mexico City (CDMX)", location_type: 'City', parent_id: mexico.id)
cancun  = Location.create!(name: "Cancun", location_type: 'City', parent_id: mexico.id)
cozumel  = Location.create!(name: "Cozumel", location_type: 'City', parent_id: mexico.id)
cabo_san_lucas  = Location.create!(name: "Cabo San Lucas", location_type: 'City', parent_id: mexico.id)


central_america = Location.create!(name: "Central America", location_type: 'Region')
costa_rica = Location.create!(name: "Costa Rica", location_type: 'Country', parent_id: central_america.id)
belieze = Location.create!(name: "Belieze", location_type: 'Country', parent_id: central_america.id)
el_salvador = Location.create!(name: "El Salvador", location_type: 'Country', parent_id: central_america.id)
guatemala = Location.create!(name: "Guatemala", location_type: 'Country', parent_id: central_america.id)
honduras = Location.create!(name: "Honduras", location_type: 'Country', parent_id: central_america.id)
nicaragua = Location.create!(name: "Nicaragua", location_type: 'Country', parent_id: central_america.id)
panama = Location.create!(name: "Panama", location_type: 'Country', parent_id: central_america.id)



caribbean = Location.create!(name: "Caribbean", location_type: 'Region')
bahamas = Location.create!(name: "Bahamas", location_type: 'Country', parent_id: caribbean.id)
jamaica = Location.create!(name: "Jamaica", location_type: 'Country', parent_id: caribbean.id)
cuba = Location.create!(name: "Cuba", location_type: 'Country', parent_id: caribbean.id)
bermuda = Location.create!(name: "Bermuda", location_type: 'Country', parent_id: caribbean.id)
turks  = Location.create!(name: "Turks and Caicos", location_type: 'Country', parent_id: caribbean.id)
st_lucia = Location.create!(name: "Saint Lucia", location_type: 'Country', parent_id: caribbean.id)
aruba = Location.create!(name: "Aruba", location_type: 'Country', parent_id: caribbean.id)
us_vi = Location.create!(name: "US Virgin Islands", location_type: 'Country', parent_id: caribbean.id)
dominican_rep = Location.create!(name: "Dominican Republic", location_type: 'Country', parent_id: caribbean.id)


south_america = Location.create!(name: "South America", location_type: 'Region')
argentina = Location.create!(name: "Argentina", location_type: 'Country', parent_id: south_america.id)
buenos_aires = Location.create!(name: "Buenos Aires", location_type: 'City', parent_id: argentina.id)

bolivia = Location.create!(name: "Bolivia", location_type: 'Country', parent_id: south_america.id)
sucre = Location.create!(name: "Sucre", location_type: 'City', parent_id: bolivia.id)

brazil = Location.create!(name: "Brazil", location_type: 'Country', parent_id: south_america.id)
rio = Location.create!(name: "Rio De Janeiro", location_type: 'City', parent_id: brazil.id)

chile = Location.create!(name: "Chile", location_type: 'Country', parent_id: south_america.id)
santiago = Location.create!(name: "Santiago", location_type: 'City', parent_id: chile.id)

ecuador = Location.create!(name: "Ecuador", location_type: 'Country', parent_id: south_america.id)
sucre = Location.create!(name: "Quito", location_type: 'City', parent_id: ecuador.id)

colombia = Location.create!(name: "Colombia", location_type: 'Country', parent_id: south_america.id)
bogota = Location.create!(name: "Bogota", location_type: 'City', parent_id: colombia.id)
medellin = Location.create!(name: "Medellin", location_type: 'City', parent_id: colombia.id)

peru = Location.create!(name: "Peru", location_type: 'Country', parent_id: south_america.id)


scandanavia = Location.create!(name: "Scandanavia", location_type: 'Region')
sweeden = Location.create!(name: "Sweeden", location_type: 'Country', parent_id: scandanavia.id)
stockholm = Location.create!(name: "Stockholm", location_type: 'City', parent_id: sweeden.id)

central_europe = Location.create!(name: "Central Europoe", location_type: 'Region')
czech = Location.create!(name: "Czech", location_type: 'Country', parent_id: central_europe.id)
prague = Location.create!(name: "Prague (Praha)", location_type: 'City', parent_id: czech.id)

hungary = Location.create!(name: "Hungary", location_type: 'Country', parent_id: central_europe.id)
budapest = Location.create!(name: "Budapest", location_type: 'City', parent_id: hungary.id)

austria = Location.create!(name: "Austria", location_type: 'Country', parent_id: central_europe.id)
vienna = Location.create!(name: "Vienna", location_type: 'City', parent_id: austria.id)

medeterranean = Location.create!(name: "Mediterranean", location_type: 'Region')
portugal = Location.create!(name: "Portugal", location_type: 'Country', parent_id: medeterranean.id)
lisbon = Location.create!(name: "Lisbon (Lisboa)", location_type: 'City', parent_id: portugal.id)

spain = Location.create!(name: "Spain", location_type: 'Country', parent_id: medeterranean.id)
barcelona = Location.create!(name: "Barcelona", location_type: 'City', parent_id: spain.id)
madrid = Location.create!(name: "Madrid", location_type: 'City', parent_id: spain.id)

greece = Location.create!(name: "Greece", location_type: 'Country', parent_id: medeterranean.id)
barcelona = Location.create!(name: "Athens", location_type: 'City', parent_id: greece.id)

italy = Location.create!(name: "Italy", location_type: 'Country', parent_id: medeterranean.id)
venice = Location.create!(name: "Venica", location_type: 'City', parent_id: italy.id)
florence = Location.create!(name: "Florence", location_type: 'City', parent_id: italy.id)
rome = Location.create!(name: "Rome", location_type: 'City', parent_id: italy.id)

croatia = Location.create!(name: "Croatia", location_type: 'Country', parent_id: medeterranean.id)
split = Location.create!(name: "Split", location_type: 'City', parent_id: croatia.id)


western_europe =  Location.create!(name: "Western Europe", location_type: 'Region')
iceland = Location.create!(name: "Iceland", location_type: 'Country', parent_id: western_europe.id)
reykjavik = Location.create!(name: "Reykjavik", location_type: 'City', parent_id: iceland.id)

ireland = Location.create!(name: "Ireland", location_type: 'Country', parent_id: western_europe.id)
dublin = Location.create!(name: "Dublin", location_type: 'City', parent_id: ireland.id)

scotland = Location.create!(name: "Scotland", location_type: 'Country', parent_id: western_europe.id)
edinbourgh = Location.create!(name: "Edinbourgh", location_type: 'City', parent_id: scotland.id)

germany = Location.create!(name: "Germany", location_type: 'Country', parent_id: western_europe.id)
berlin = Location.create!(name: "Berlin", location_type: 'City', parent_id: germany.id)

france = Location.create!(name: "France", location_type: 'Country', parent_id: western_europe.id)
paris = Location.create!(name: "Paris", location_type: 'City', parent_id: france.id)

netherlands = Location.create!(name: "Nethrelands", location_type: 'Country', parent_id: western_europe.id)
amsterdam = Location.create!(name: "Amsterdam", location_type: 'City', parent_id: netherlands.id)

germany = Location.create!(name: "Germany", location_type: 'Country', parent_id: western_europe.id)
berlin = Location.create!(name: "Berlin", location_type: 'City', parent_id: germany.id)

england = Location.create!(name: "England", location_type: 'Country', parent_id: western_europe.id)
london = Location.create!(name: "London", location_type: 'City', parent_id: england.id)

north_africa = Location.create!(name: "North Africa", location_type: 'Region')

morocco = Location.create!(name: "Morocco", location_type: 'Country', parent_id: north_africa.id)
marakesh = Location.create!(name: "Marakesh", location_type: 'City', parent_id: morocco.id)

egypt = Location.create!(name: "Egypt", location_type: 'Country', parent_id: north_africa.id)
cairo = Location.create!(name: "Cairo", location_type: 'City', parent_id: egypt.id)


middle_east = Location.create!(name: "Middle East", location_type: 'Region')
uae = Location.create!(name: "United Arab Emirates", location_type: 'Country', parent_id: middle_east.id)
dubai = Location.create!(name: "Dubai", location_type: 'City', parent_id: uae.id)

india = Location.create!(name: "India", location_type: 'Region')
mumbai = Location.create!(name: "Mumbai", location_type: 'City', parent_id: india.id)
delhi = Location.create!(name: "Delhi", location_type: 'City', parent_id: india.id)
bangalor = Location.create!(name: "bangalor", location_type: 'City', parent_id: india.id)


asia = Location.create!(name: "Asia", location_type: 'Region')
china = Location.create!(name: "China", location_type: 'Country', parent_id: asia.id)
shanghai = Location.create!(name: "Shanghai", location_type: 'City', parent_id: china.id)
beijing = Location.create!(name: "Beijing", location_type: 'City', parent_id: china.id)
hong_kong = Location.create!(name: "Hong Kong", location_type: 'City', parent_id: china.id)

japan = Location.create!(name: "Japan", location_type: 'Country', parent_id: asia.id)
tokyo = Location.create!(name: "Tokyo", location_type: 'City', parent_id: japan.id)

south_korea = Location.create!(name: "South Korea", location_type: 'Country', parent_id: asia.id)
seoul = Location.create!(name: "Seoul", location_type: 'City', parent_id: south_korea.id)

taiwan = Location.create!(name: "Taiwan", location_type: 'Country', parent_id: asia.id)
taipei = Location.create!(name: "New Taipei", location_type: 'City', parent_id: taiwan.id)

japan = Location.create!(name: "Japan", location_type: 'Country', parent_id: asia.id)
tokyo = Location.create!(name: "Tokyo", location_type: 'City', parent_id: japan.id)

indonesia = Location.create!(name: "Indonesia", location_type: 'Country', parent_id: asia.id)
jakarta = Location.create!(name: "Jakarta", location_type: 'City', parent_id: indonesia.id)
bali = Location.create!(name: "Bali", location_type: 'City', parent_id: indonesia.id)

thailand = Location.create!(name: "Thailand", location_type: 'Country', parent_id: asia.id)
bangkok = Location.create!(name: "Bangkok", location_type: 'City', parent_id: thailand.id)

vietnam = Location.create!(name: "Vietnam", location_type: 'Country', parent_id: asia.id)
ho_chi_min = Location.create!(name: "Ho Chi Min", location_type: 'City', parent_id: vietnam.id)
hanoi = Location.create!(name: "Hanoi", location_type: 'City', parent_id: vietnam.id)

singapore = Location.create!(name: "Singapore", location_type: 'Country', parent_id: asia.id)

malaysia = Location.create!(name: "Malaysia", location_type: 'Country', parent_id: asia.id)
kuala_lumpur = Location.create!(name: "Kuala Lumpur", location_type: 'City', parent_id: malaysia.id)

cambodia = Location.create!(name: "Cambodia", location_type: 'Country', parent_id: asia.id)
siem_reap = Location.create!(name: "Siem Reap", location_type: 'City', parent_id: cambodia.id)


australia = Location.create!(name: "Australia", location_type: 'Region')
sydney = Location.create!(name: "Sydney", location_type: 'City', parent_id: australia.id)
melbourne = Location.create!(name: "Melbourne", location_type: 'City', parent_id: australia.id)

