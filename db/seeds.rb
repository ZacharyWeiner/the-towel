# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
################################## Roles  #######################################
puts 'Build Roles'
site_admin = Role.create(title: 'site_admin')
cohort_admin = Role.create(title: 'cohort_admin')
city_admin = Role.create(title: 'city_admin')
client = Role.create(title: 'cohort_member')
puts 'End Build Roles'
################################## End Roles  #######################################

################################## Cohorts #######################################
puts 'Build Cohorts'
nation = Cohort.create!(name: "Remote Nation", description:"That Nomad Life",)
libertatem = Cohort.create!(name: "Libertatem", description:"Chasing Winter", start_date:Date.parse('28-08-2016'), end_date: Date.parse('26-08-2017'))

meraki = Cohort.create!(name: "Meraki", description:"Chasing Summer", start_date:Date.parse('28-01-2017'), end_date: Date.parse('26-01-2018'))
puts 'End Build Cohorts'
################################## End Cohorts #######################################

################################## Users  #######################################
puts 'Build Users'
paulina = User.create!(email: "paulina@ry.com", password: 'password')
westy = User.create!(email: "westy@ry.com", password: 'password')
alexandra = User.create!(email: "alexandra@ry.com", password: 'password')
coti = User.create!(email: "coti@ry.com", password: 'password')
jo = User.create!(email: "jose@ry.com", password: 'password')
zack = User.create!(email:'zack@ry.com', password: 'password')
trabka = User.create!(email:'trabka@ry.com', password: 'password')
andrea = User.create!(email:'andrea@ry.com', password: 'password')

zack.roles << client
trabka.roles << client
andrea.roles << client

libertatem.users << [zack, trabka, andrea]
puts 'End Build Users'
################################## End Users #######################################

################################## Posts  #####################################
Post.create!(user: zack, cohort: libertatem, content: "This Trip Is Awesome")
Post.create!(user: andrea, cohort: libertatem, content: "Andreas Trip Is Awesome")
Post.create!(user: zack, cohort: nation, content: "Ima citizen!")
################################## End Posts  #####################################

################################## Locations #######################################
puts 'Build Locations'
asia = Location.create!(name:"Asia", location_type: 'region')
malaysia = Location.create!(name: 'Malaysia', location_type: 'country', parent: asia)
kl = Location.create!(name: 'Kuala Lumpur', location_type:'city', parent: malaysia)
thailand = Location.create!(name:"Thailand", location_type: 'country', parent: asia)
bangkok = Location.create!(name:"Bangkok", location_type: 'city', parent: thailand)
changmai = Location.create!(name:"Chang Mai", location_type: 'city', parent: thailand)
kohphanagan = Location.create!(name:"Koh Phangan", location_type: 'city', parent: thailand)
cambodia = Location.create!(name: 'Cambodia', location_type: 'country', parent: asia)
phnompenh = Location.create!(name: 'Phnom Penh', location_type:'city', parent: cambodia)

europe = Location.create!(name:"Europe", location_type: 'region')
england = Location.create!(name:"England", location_type: 'country', parent: europe)
london = Location.create!(name:"London", location_type: 'city', parent: england)
france = Location.create!(name:"France", location_type: 'country', parent: europe)
paris = Location.create!(name:"Paris", location_type: 'city', parent: france)
croatia = Location.create(name: 'Croatia', location_type: 'country', parent: europe)
split = Location.create!(name: 'Split', location_type: 'city', parent: croatia)
czech = Location.create!(name: 'Czech Republik', location_type: 'country', parent: europe)
prague = Location.create!(name: 'Prague', location_type: 'city', parent: czech)
portugal = Location.create!(name: 'Portugal', location_type: 'country', parent: europe)
lisbon = Location.create!(name: 'Lisbon', location_type: 'city', parent: portugal)

puts "End Build Locations"
################################## End Locations #######################################

################################## Events #######################################
puts "Build Events"
Event.create!(title: "Dinner @ Cruz", date: Date.today + 10.days, start_time: Time.now, description: "Details for Dinner @ Cruz", location: london, cohort: libertatem, event_type: 'cohort')
Event.create!(title: "Lunch @ Havana", date: Date.today + 15.days, start_time: Time.now, description: "Details for Lunch @ Havana", location: london, cohort: libertatem, event_type: 'cohort')
Event.create!(title: "Dinner with Locals ", date: Date.today + 20.days, start_time: Time.now, description: "Details for Dinner with Locals", location: london, cohort: meraki, event_type: 'track')
puts "End Build Events"
################################## End Events #######################################

################################## Companies #######################################
puts "Build Companies"
avianca = Company.create!(name:'Avianca', website:'www.avianca.com', company_type: 'airline')
delta = Company.create!(name:'Delta', website:'www.delta.com', company_type: 'airline')
greyhound = Company.create!(name:'Greyhound', website:'www.greyhound.com', company_type: 'bus')
adventure_company = Company.create!(name:'Great Adventures', website:'www.greatadventures.com', company_type: 'activity')
puts 'End Build Companies'
################################## End Companies #######################################

################################## Lodging  #######################################
puts 'End Build Lodging'
bangkok_hilton = Lodging.create!(name: "Hilton", phone: '1-888-888-8888', website: 'www.hilton.com/bangkok', address:'123 bangkok street', location:bangkok)
london_4Seasons = Lodging.create!(name: "Four Seasons", phone: '1-888-888-8888', website: 'www.fourseasons.com/london', address:'123 london street', location:london)
airbnb_paris = Lodging.create!(name: "Air BnB", phone: '1-888-888-8888', website: 'www.airbnb.com/asdsa', address:'987 paris street', location:paris)
puts 'End Build Lodging'
################################## End Lodging  #####################################

################################## Transits  #######################################

kl_to_thailand = Transit.create(date: Date.today + 30.days, title: 'KL to Chang Mai', departure_location_id: kl.id, arrival_location_id: changmai.id)
thailand_to_cambodia = Transit.create(date: Date.today + 60.days, title: 'Thailand to Cambodia', departure_location: changmai, arrival_location: phnompenh)
cambodia_to_croatia = Transit.create(date: Date.today + 90.days, title: 'Cambodia To Split', departure_location: phnompenh, arrival_location: split)
croatia_to_czech = Transit.create(date: Date.today + 120.days, title: 'Split To Prague', departure_location: split, arrival_location: prague)
czech_to_lisbon = Transit.create(date: Date.today + 150.days, title: 'Prague TO Lisbon', departure_location: split, arrival_location: lisbon)

libertatem.transits << thailand_to_cambodia
libertatem.transits << kl_to_thailand
libertatem.transits << cambodia_to_croatia
libertatem.transits << croatia_to_czech
libertatem.transits << czech_to_lisbon




