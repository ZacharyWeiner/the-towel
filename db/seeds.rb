# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

################################## Cohorts #######################################
libertatem = Cohort.create!(name: "Libertatem", description:"Chasing Winter", start_date:Date.parse('28-08-2016'), end_date: Date.parse('26-08-2017'))

meraki = Cohort.create!(name: "Meraki", description:"Chasing Summer", start_date:Date.parse('28-01-2017'), end_date: Date.parse('26-01-2018'))
################################## End Cohorts #######################################

################################## Users  #######################################
################################## End Users #######################################
paulina = User.create!(email: "paulina@ry.com", password: 'password')
westy = User.create!(email: "westy@ry.com", password: 'password')
alexandra = User.create!(email: "alexandra@ry.com", password: 'password')
coti = User.create!(email: "coti@ry.com", password: 'password') 
jo = User.create!(email: "jose@ry.com", password: 'password')
zack = User.create!(email:'zack@ry.com', password: 'password')
trabka = User.create!(email:'trabka@ry.com', password: 'password')
andrea = User.create!(email:'andrea@ry.com', password: 'password')
################################## Locations #######################################
puts 'Build Locations'
asia = Location.create!(name:"Asia", location_type: 'region')
thailand = Location.create!(name:"Thailand", location_type: 'country', parent: asia)
bangkok = Location.create!(name:"Bangkok", location_type: 'city', parent: thailand)
changmai = Location.create!(name:"Chang Mai", location_type: 'city', parent: thailand)
kohphanagan = Location.create!(name:"Koh Phangan", location_type: 'city', parent: thailand)

europe = Location.create!(name:"Europe", location_type: 'region')
england = Location.create!(name:"England", location_type: 'country', parent: europe)
london = Location.create!(name:"London", location_type: 'city', parent: england)
france = Location.create!(name:"France", location_type: 'country', parent: europe)
paris = Location.create!(name:"Paris", location_type: 'city', parent: france)

puts "End Build Locations"
################################## End Locations #######################################

################################## Events #######################################
puts "Build Events"
Event.create!(title: "Dinner @ Cruz", date: Date.today + 10.days, start_time: Time.now, description: "Details for Dinner @ Cruz", location: london)
Event.create!(title: "Lunch @ Havana", date: Date.today + 15.days, start_time: Time.now, description: "Details for Lunch @ Havana", location: london)
Event.create!(title: "Dinner with Locals ", date: Date.today + 20.days, start_time: Time.now, description: "Details for Dinner with Locals", location: london)
puts "End Build Events"
################################## End Events #######################################

################################## Companies #######################################
puts "Build Companies"
avianca = Company.create!(name:'Avianca', website:'www.avianca.com', company_type: 'airline')
delta = Company.create!(name:'Delta', website:'www.delta.com', company_type: 'airline')
greyhound = Company.create!(name:'Greyhound', website:'www.greyhound.com', company_type: 'bus')
adventure_company = Company.create!(name:'Great Adventures', website:'www.greatadventures.com', company_type: 'activity')
################################## End Companies #######################################
################################## Lodging  #######################################
bangkok_hilton = Lodging.create!(name: "Hilton", phone: '1-888-888-8888', website: 'www.hilton.com/bangkok', address:'123 bangkok street', location:bangkok)
london_4Seasons = Lodging.create!(name: "Four Seasons", phone: '1-888-888-8888', website: 'www.fourseasons.com/london', address:'123 london street', location:london)
airbnb_paris = Lodging.create!(name: "Air BnB", phone: '1-888-888-8888', website: 'www.airbnb.com/asdsa', address:'987 paris street', location:paris)

################################## End Lodging  #######################################
