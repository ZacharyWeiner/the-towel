# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

################################## Organization  #######################################
digital_nomads =Organization.create!(name:'Digital Nomads', description: 'Being a digital nomad is ... ')
remote_year = Organization.create!(name:'Remote Year', description: 'Reemote Year is ...')
we_roam = Organization.create!(name:'We Roam', description: 'We Roam')
################################## End Organization  #######################################

################################## Roles  #######################################
puts 'Build Roles'
super_admin = Role.create(title: 'super_admin')
site_admin = Role.create(title: 'site_admin')
org_admin = Role.create(title: 'organization_admin')
cohort_admin = Role.create(title: 'cohort_admin')
city_admin = Role.create(title: 'city_admin')
client = Role.create(title: 'cohort_member')
puts 'End Build Roles'
################################## End Roles  #######################################

################################## Cohorts #######################################
puts 'Build Cohorts'
nomad_nation = Cohort.create(name: "Nomad Nation", description:"We Dem DigiNoms", organization: digital_nomads)
nation = Cohort.create!(name: "Remote Nation", description:"That Nomad Life", organization: remote_year)
libertatem = Cohort.create!(name: "Libertatem", description:"Chasing Winter",  organization: remote_year, start_date:Date.parse('28-08-2016'), end_date: Date.parse('26-08-2017'))

meraki = Cohort.create!(name: "Meraki", description:"Chasing Summer",  organization: remote_year, start_date:Date.parse('28-01-2017'), end_date: Date.parse('27-01-20178'))
kublai = Cohort.create!(name: "Kublai", description:"Chasing Summer",  organization: remote_year, start_date:Date.parse('28-01-2017'), end_date: Date.parse('03-03-2018'))
balboa = Cohort.create!(name: "Balboa", description:"Chasing Summer",  organization: remote_year, start_date:Date.parse('28-01-2017'), end_date: Date.parse('03-03-2018'))
kaizen = Cohort.create!(name: "Kaizen", description:"Chasing Summer",  organization: remote_year, start_date:Date.parse('28-01-2017'), end_date: Date.parse('31-03-2018'))
veritas = Cohort.create!(name: "Veritas", description:"Chasing Summer",  organization: remote_year, start_date:Date.parse('28-01-2017'), end_date: Date.parse('28-04-2018'))
earhart = Cohort.create!(name: "Earhart", description:"Chasing Summer",  organization: remote_year, start_date:Date.parse('28-01-2017'), end_date: Date.parse('26-05-2018'))
yugen = Cohort.create!(name: "Yugen", description:"Chasing Summer",  organization: remote_year, start_date:Date.parse('28-01-2017'), end_date: Date.parse('30-07-2018'))
sonder = Cohort.create!(name: "Sonder", description:"Chasing Summer",  organization: remote_year, start_date:Date.parse('28-01-2017'), end_date: Date.parse('25-08-2018'))
mangata = Cohort.create!(name: "Mangata", description:"Chasing Summer",  organization: remote_year, start_date:Date.parse('26-08-2018'), end_date: Date.parse('29-09-2018'))
sisu = Cohort.create!(name: "Sisu", description:"Chasing Summer",  organization: remote_year, start_date:Date.parse('04-11-2018'), end_date: Date.parse('03-03-2018'))

we_roam_nation = Cohort.create!(name: "We Roam Nation", description:"We Roam All Year Round",  organization: we_roam, start_date:Date.parse('28-01-2017'), end_date: Date.parse('26-01-2018'))
puts 'End Build Cohorts'
################################## End Cohorts #######################################

################################## Users  #######################################
puts 'Build Users'

super_admin_user = User.create(email: "super_admin@the-towel.com", password: 'password',  organization: digital_nomads)
site_admin_user = User.create(email: "site_admin@the-towel.com", password: 'password',  organization: digital_nomads)
nomad_admin = User.create(email: "digi@nom.com", password: 'password',  organization: digital_nomads)
nomad_admin.roles << org_admin


paulina = User.create!(email: "paulina@ry.com", password: 'password',  organization: remote_year)
westy = User.create!(email: "westy@ry.com", password: 'password',  organization: remote_year)
alexandra = User.create!(email: "alexandra@ry.com", password: 'password',  organization: remote_year)
coti = User.create!(email: "coti@ry.com", password: 'password',  organization: remote_year)
jo = User.create!(email: "jose@ry.com", password: 'password',  organization: remote_year)
zack = User.create!(email:'zack@ry.com', password: 'password',  organization: remote_year)
trabka = User.create!(email:'trabka@ry.com', password: 'password',  organization: remote_year)
andrea = User.create!(email:'andrea@ry.com', password: 'password',  organization: remote_year)
geordan = User.create!(email:'geordan@ry.com', password: 'password',  organization: remote_year)
gemma = User.create!(email:'gemma@ry.com', password: 'password',  organization: remote_year)
chech = User.create!(email:'chech@ry.com', password: 'password',  organization: remote_year)
alison = User.create!(email:'alison@ry.com', password: 'password',  organization: remote_year)
greg = User.create!(email:'greg@ry.com', password: 'password',  organization: remote_year)


# Balboa People #

amy_e = User.create!(email:'amy_e@balboa.com', password: 'password',  organization: remote_year)
andrei = User.create!(email:'andrei@balboa.com', password: 'password',  organization: remote_year)
annabel = User.create!(email:'annabel@balboa.com', password: 'password',  organization: remote_year)
ashley_m = User.create!(email:'ashley_m@balboa.com', password: 'password',  organization: remote_year)
chris_t = User.create!(email:'chris_t@balboa.com', password: 'password',  organization: remote_year)
feef = User.create!(email:'feef@balboa.com', password: 'password',  organization: remote_year)
grace = User.create!(email:'grace@balboa.com', password: 'password',  organization: remote_year)
hailey = User.create!(email:'haley@balboa.com', password: 'password',  organization: remote_year)
jamie_o = User.create!(email:'jamie_o@balboa.com', password: 'password',  organization: remote_year)
jarett = User.create!(email:'jarett@balboa.com', password: 'password',  organization: remote_year)
jenna = User.create!(email:'jenna@balboa.com', password: 'password',  organization: remote_year)
jessica_s = User.create!(email:'jessica_s@balboa.com', password: 'password',  organization: remote_year)
jon_l = User.create!(email:'jon_l@balboa.com', password: 'password',  organization: remote_year)
katie_m = User.create!(email:'katie_m@balboa.com', password: 'password',  organization: remote_year)
aj = User.create!(email:'aj@balboa.com', password: 'password',  organization: remote_year)
adrienne = User.create!(email:'adreinne@balboa.com', password: 'password',  organization: remote_year)
brad_w = User.create!(email:'brad_w@balboa.com', password: 'password',  organization: remote_year)
brandon_c = User.create!(email:'brandon_c@balboa.com', password: 'password',  organization: remote_year)
brittany_m = User.create!(email:'brittany_m@balboa.com', password: 'password',  organization: remote_year)
chelsea_k = User.create!(email:'chelsea_k@balboa.com', password: 'password',  organization: remote_year)
chris_h = User.create!(email:'chris_hß@balboa.com', password: 'password',  organization: remote_year)

#Balboa PM #
anastasia = User.create!(email:'anastasia@ry.com', password: 'password',  organization: remote_year)
sara = User.create!(email:'sara@ry.com', password: 'password',  organization: remote_year)




phil = User.create!(email:'phil@we-roam.com', password: 'password',  organization: we_roam)
phil.roles << org_admin

justin = User.create!(email:'justin@weroam.com', password: 'password',  organization: we_roam)
patrick = User.create!(email:'patrick@weroam.com', password: 'password',  organization: we_roam)
lilly = User.create!(email:'lilly@weroam.com', password: 'password',  organization: we_roam)

super_admin_user.roles << super_admin
site_admin_user.roles << site_admin

westy.roles << cohort_admin
alexandra.roles << cohort_admin
jo.roles << city_admin
coti.roles << city_admin
paulina.roles << org_admin

zack.roles << client
trabka.roles << client
andrea.roles << client
geordan.roles << client
gemma.roles << client
chech.roles << client
alison.roles << client
greg.roles << client

libertatem.users << [zack, trabka, andrea, geordan, gemma, chech, alison, westy, alexandra, greg]
nation.users << [zack, trabka, andrea, geordan, gemma, chech, alison, westy, alexandra, jo, coti, paulina, greg]


#Balboa Roles

amy_e.roles << client
andrei.roles << client
annabel.roles << client
ashley_m.roles << client
chris_t.roles << client
feef.roles << client
grace.roles << client
hailey.roles << client
jamie_o.roles << client
jarett.roles << client
jenna.roles << client
jessica_s.roles << client
jon_l.roles << client
katie_m.roles << client
aj.roles << client
adrienne.roles << client
brad_w.roles << client
brandon_c.roles << client
brittany_m.roles << client
chelsea_k.roles << client
chris_h.roles << client

anastasia.roles << cohort_admin
sara.roles << cohort_admin
balboa.users << [amy_e, andrei, annabel, ashley_m, chris_t, feef, grace, hailey, jamie_o, jarett, jenna, jessica_s]
balboa.users << [katie_m, aj, adrienne, brad_w, brandon_c, brittany_m, chelsea_k, chris_h]
balboa.users << [anastasia, sara]

nation.users << [amy_e, andrei, annabel, ashley_m, chris_t, feef, grace, hailey, jamie_o, jarett, jenna, jessica_s, katie_m, aj, adrienne, brad_w, brandon_c, brittany_m, chelsea_k, chris_h]
#Balboa Roles














justin.roles << org_admin
patrick.roles << cohort_admin
lilly.roles << client

we_roam_nation.users << [justin, patrick, lilly]
nomad_nation.users << nomad_admin
puts 'End Build Users'
################################## End Users #######################################

################################## Posts  #####################################
Post.create!(user: zack, cohort: libertatem, content: "This Trip Is Awesome")
Post.create!(user: andrea, cohort: libertatem, content: "Andreas Trip Is Awesome")
Post.create!(user: zack, cohort: nation, content: "Ima citizen!")
################################## End Posts  #####################################

##################################  Tag Types  #####################################
puts 'Build Tags'
tag_type_housing = TagType.create!(name: 'Housing')
tag_type_location = TagType.create!(name: 'Location')
tag_type_event = TagType.create!(name: 'Event')
tag_type_side_trip = TagType.create!(name: 'Side Trip')
tag_type_photo = TagType.create!(name: 'Photo')
tag_type_skill = TagType.create!(name: 'Skill')
tag_type_interest = TagType.create!(name: 'Interest')
################################## End Tag Types  #####################################

##################################  Tags  #####################################
natural_light = Tag.create!(name: 'Natural Light', tag_type: tag_type_housing)
good_wifi = Tag.create!(name: 'Strong Wifi', tag_type: tag_type_housing)
modern = Tag.create!(name: 'Modern', tag_type: tag_type_housing)
city_center = Tag.create!(name: 'Close to City Center', tag_type: tag_type_housing)
close_to_workspace = Tag.create!(name: 'Close to Workspace', tag_type: tag_type_housing)
single_bedroom = Tag.create!(name: 'Live Alone', tag_type: tag_type_housing)
full_kitchen = Tag.create!(name: 'Full Kitchen', tag_type: tag_type_housing)
close_to_other_housing = Tag.create!(name: 'Close To Other Housing', tag_type: tag_type_housing)

location_moutains = Tag.create!(name: 'Moutains', tag_type: tag_type_location)
location_beach = Tag.create!(name: 'Beach', tag_type: tag_type_location)
location_desert = Tag.create!(name: 'Desert', tag_type: tag_type_location)
location_cloud_forrest = Tag.create!(name: 'Cloud Forrest', tag_type: tag_type_location)

event_outdoors = Tag.create!(name: 'Outdoors', tag_type: tag_type_event)
event_sports = Tag.create!(name: 'Sports', tag_type: tag_type_event)
event_cultural = Tag.create!(name: 'Cultrual', tag_type: tag_type_event)
event_food = Tag.create!(name: 'Food', tag_type: tag_type_event)
event_birthday = Tag.create!(name: 'Cultrual', tag_type: tag_type_event)
event_other = Tag.create!(name: 'Other', tag_type: tag_type_event)

side_trip_adventure = Tag.create!(name: 'Adventure', tag_type: tag_type_side_trip)
side_trip_historical = Tag.create!(name: 'Historical', tag_type: tag_type_side_trip)
side_trip_nature = Tag.create!(name: 'Nature', tag_type: tag_type_side_trip)

skills_web = Tag.create!(name: 'Web Development', tag_type: tag_type_skill)
skills_mobile = Tag.create!(name: 'Mobile Development', tag_type: tag_type_skill)
skills_it = Tag.create!(name: 'General IT', tag_type: tag_type_skill)
skills_marketing = Tag.create!(name: 'Marketing', tag_type: tag_type_skill)
skills_photography = Tag.create!(name: 'Photography', tag_type: tag_type_skill)
skills_videography = Tag.create!(name: 'Videography', tag_type: tag_type_skill)
skills_real_estate = Tag.create!(name: 'Real Estate', tag_type: tag_type_skill)
skills_management = Tag.create!(name: 'Managment', tag_type: tag_type_skill)

interest_art = Tag.create!(name: 'Art', tag_type: tag_type_interest)
interest_night_life = Tag.create!(name: 'Night Life', tag_type: tag_type_interest)
interest_museaums = Tag.create!(name: 'Museaums', tag_type: tag_type_interest)
interest_parks = Tag.create!(name: 'Parks', tag_type: tag_type_interest)
interest_live_music = Tag.create!(name: 'Live Music', tag_type: tag_type_interest)
interest_street_markets = Tag.create!(name: 'Street Markets', tag_type: tag_type_interest)
interest_scuba = Tag.create!(name: 'Scuba', tag_type: tag_type_interest)
interest_snowboarding = Tag.create!(name: 'Snowboarding', tag_type: tag_type_interest)
puts 'End Build Tags'
################################## End Tag  #####################################

##################################  User Housing Tag  #####################################
puts "Build user housing Tags"

zack.tags << [modern, good_wifi, city_center]
trabka.tags << [modern, good_wifi, natural_light]
andrea.tags << [single_bedroom, close_to_workspace, city_center]
geordan.tags << [good_wifi, city_center, close_to_other_housing]
gemma.tags << [modern, good_wifi, full_kitchen]
chech.tags << [close_to_other_housing, city_center, natural_light]
alison.tags << [modern, natural_light, close_to_workspace]






amy_e.tags << [modern, good_wifi, city_center]
andrei.tags << [modern, good_wifi, natural_light]
annabel.tags << [single_bedroom, close_to_workspace, city_center]
ashley_m.tags << [good_wifi, city_center, close_to_other_housing]
chris_t.tags << [modern, good_wifi, full_kitchen]
feef.tags << [close_to_other_housing, city_center, natural_light]
grace.tags << [modern, natural_light, close_to_workspace]
hailey.tags << [modern, natural_light, close_to_workspace]
jamie_o.tags << [close_to_other_housing, city_center, natural_light]
jarett.tags << [modern, good_wifi, full_kitchen]
jenna.tags << [good_wifi, city_center, close_to_other_housing]
jessica_s.tags << [single_bedroom, close_to_workspace, city_center]
jon_l.tags << [modern, good_wifi, natural_light]
katie_m.tags << [modern, good_wifi, city_center]
aj.tags << [modern, natural_light, close_to_workspace]
adrienne.tags << [close_to_other_housing, city_center, natural_light]
brad_w.tags << [good_wifi, city_center, close_to_other_housing]
brandon_c.tags << [modern, good_wifi, city_center]
brittany_m.tags << [single_bedroom, close_to_workspace, city_center]
chelsea_k.tags << [close_to_other_housing, city_center, natural_light]
chris_h.tags << [single_bedroom, close_to_workspace, city_center]

##################################  End User Housing Tag  #####################################

##################################  RoommateRequests  #####################################
RoomateRequest.create!(requester: trabka, requested_roomate: zack)
RoomateRequest.create!(requester: trabka, requested_roomate: geordan)
RoomateRequest.create!(requester: zack, requested_roomate: geordan)
RoomateRequest.create!(requester: andrea, requested_roomate: alison)
RoomateRequest.create!(requester: chech, requested_roomate: gemma)
RoomateRequest.create!(requester: geordan, requested_roomate: gemma)
RoomateRequest.create!(requester: alison, requested_roomate: andrea)

RoomateRequest.create!(requester: amy_e, requested_roomate: andrei)
RoomateRequest.create!(requester: annabel, requested_roomate: ashley_m)
RoomateRequest.create!(requester: chris_t, requested_roomate: feef)
RoomateRequest.create!(requester: grace, requested_roomate: hailey)
RoomateRequest.create!(requester: jamie_o, requested_roomate: jarett)
RoomateRequest.create!(requester: jenna, requested_roomate: jessica_s)
RoomateRequest.create!(requester: jon_l, requested_roomate: katie_m)
RoomateRequest.create!(requester: katie_m, requested_roomate: aj)
RoomateRequest.create!(requester: brad_w, requested_roomate: brandon_c)
RoomateRequest.create!(requester: brittany_m, requested_roomate: chelsea_k)
RoomateRequest.create!(requester: chris_h, requested_roomate: jon_l)
RoomateRequest.create!(requester: andrei, requested_roomate: ashley_m)
RoomateRequest.create!(requester: ashley_m, requested_roomate: feef)
RoomateRequest.create!(requester: feef, requested_roomate: hailey)
RoomateRequest.create!(requester: jarett, requested_roomate: jessica_s)
RoomateRequest.create!(requester: jessica_s, requested_roomate: katie_m)
RoomateRequest.create!(requester: katie_m, requested_roomate: aj)
RoomateRequest.create!(requester: brandon_c, requested_roomate: chelsea_k)
RoomateRequest.create!(requester: chelsea_k, requested_roomate: jon_l)
RoomateRequest.create!(requester: ashley_m, requested_roomate: feef)
RoomateRequest.create!(requester: feef, requested_roomate: hailey)
RoomateRequest.create!(requester: hailey, requested_roomate: jessica_s)

##################################  RoommateRequests End #####################################

################################## Locations #######################################
puts 'Build Locations'
asia = Location.create!(name:"Asia", location_type: 'region')
malaysia = Location.create!(name: 'Malaysia', location_type: 'country', parent: asia)
kl = Location.create!(name: 'Kuala Lumpur', location_type:'city', parent: malaysia)
sandakan = Location.create!(name: 'Sandakan', location_type:'city', parent: malaysia)
thailand = Location.create!(name:"Thailand", location_type: 'country', parent: asia)
bangkok = Location.create!(name:"Bangkok", location_type: 'city', parent: thailand)
changmai = Location.create!(name:"Chiang Mai", location_type: 'city', parent: thailand)
kohphanagan = Location.create!(name:"Koh Phangan", location_type: 'city', parent: thailand)
cambodia = Location.create!(name: 'Cambodia', location_type: 'country', parent: asia)
phnompenh = Location.create!(name: 'Phnom Penh', location_type:'city', parent: cambodia)
japan = Location.create!(name: 'Japan', location_type: 'country', parent: asia)
kyoto = Location.create!(name: 'Kyoto', location_type:'city', parent: japan)
vietnam = Location.create!(name: 'Vietnam', location_type: 'country', parent: asia)
hanoi = Location.create!(name: 'Hanoi', location_type:'city', parent: vietnam)

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
spain = Location.create!(name: 'Spain', location_type: 'country', parent: europe)
valencia = Location.create!(name: 'Valencia', location_type: 'city', parent: spain)
bulgaria = Location.create!(name: 'Bulgaria', location_type: 'country', parent: europe)
sofia = Location.create!(name: 'Sofia', location_type: 'city', parent: bulgaria)
serbia = Location.create!(name: 'Serbia', location_type: 'country', parent: europe)
belgrade = Location.create!(name: 'Belgrade', location_type: 'city', parent: serbia)

latam = Location.create!(name:"Latin America", location_type: 'region')
argentina = Location.create!(name:"Argentina", location_type: 'country', parent: latam)
buenos_aires = Location.create!(name: 'Buenos Aires', location_type: 'city', parent: argentina)
cordoba = Location.create!(name: 'Cordoba', location_type: 'city', parent: argentina)

peru = Location.create!(name:"Peru", location_type: 'country', parent: latam)
lima = Location.create!(name: 'Lima', location_type: 'city', parent: peru)

colombia = Location.create!(name:"Colombia", location_type: 'country', parent: latam)
medellin = Location.create!(name: 'Medellin', location_type: 'city', parent: colombia)
bogota = Location.create!(name: 'Bogota', location_type: 'city', parent: colombia)

mexico = Location.create!(name:"Mexico", location_type: 'country', parent: latam)
mexico_city = Location.create!(name: 'Mexico City', location_type: 'city', parent: mexico)

chile = Location.create!(name:"Chile", location_type: 'country', parent: latam)
santiago = Location.create!(name: 'Santiago', location_type: 'city', parent: chile)

africa = Location.create!(name:"Africa", location_type: 'region')
morocco = Location.create!(name:"Morocco", location_type: 'country', parent: africa)
marrakesh = Location.create!(name: 'Merrakesh', location_type: 'city', parent: morocco)

south_africa = Location.create!(name:"South Africa", location_type: 'country', parent: africa)
capetown = Location.create!(name: 'Capetown', location_type: 'city', parent: south_africa)

puts "End Build Locations"
################################## End Locations #######################################

################################## Events #######################################
puts "Build Events"
Event.create!(title: "Dinner @ Cruz", date: Date.today + 10.days, start_time: Time.now, description: "Details for Dinner @ Cruz", location: london, cohort: libertatem, event_type: 'cohort', cost: 30)
Event.create!(title: "Lunch @ Havana", date: Date.today + 15.days, start_time: Time.now, description: "Details for Lunch @ Havana", location: london, cohort: libertatem, event_type: 'cohort')
Event.create!(title: "Dinner with Locals ", date: Date.today + 20.days, start_time: Time.now, description: "Details for Dinner with Locals", location: london, cohort: meraki, event_type: 'track', cost: 20)

Event.create!(title: "Dinner with Locals ", date: Date.today + 8.days, start_time: Time.now, description: "Details for Dinner with Locals", location: buenos_aires, cohort: balboa, event_type: 'cohort', cost: 20, capacity: 45)
Event.create!(title: "Lunch At UCO", date: Date.today + 4.days, start_time: Time.now, description: "Details for UCO", location: buenos_aires, cohort: balboa, event_type: 'cohort', cost: 40, capacity: 10)

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
borneo_travel_company_lodging = Lodging.create!(name: "Borneo Adventure Bungalows", phone: '1-888-888-8888', website: 'www.borneo.com/asdsa', address:'987 sandakan street', location:sandakan)
puts 'End Build Lodging'
################################## End Lodging  #####################################

################################## Schedule Items  #######################################
puts 'Build Schedule Items'
libertatem_kl = ScheduleItem.create!(cohort: libertatem, location: kl, arrival_date: Date.today + 2.days, departure_date: Date.today + 30.days)
libertatem_changmai = ScheduleItem.create!(cohort: libertatem, location: changmai, arrival_date: Date.today + 60.days, departure_date: Date.today + 90.days)
libertatem_cambodia = ScheduleItem.create!(cohort: libertatem, location: phnompenh, arrival_date: Date.today + 90.days, departure_date: Date.today + 120.days)
libertatem_split = ScheduleItem.create!(cohort: libertatem, location: split, arrival_date: Date.today + 120.days, departure_date: Date.today + 150.days)
libertatem_prague = ScheduleItem.create!(cohort: libertatem, location: prague, arrival_date: Date.today + 150.days, departure_date: Date.today + 180.days)
libertatem_lisbon = ScheduleItem.create!(cohort: libertatem, location: lisbon, arrival_date: Date.today + 180.days, departure_date: Date.today + 210.days)



balboa_buenos_aries = ScheduleItem.create!(cohort: balboa, location: buenos_aires, arrival_date: Date.parse('26-08-2017'), departure_date: Date.parse('30-09-2017'))
balboa_cordoba = ScheduleItem.create!(cohort: balboa, location: cordoba, arrival_date: Date.parse('30-09-2017'), departure_date: Date.parse('04-11-2017'))
balboa_lima = ScheduleItem.create!(cohort: balboa, location: lima, arrival_date: Date.parse('04-11-2017'), departure_date: Date.parse('02-12-2017'))
balboa_medellin = ScheduleItem.create!(cohort: balboa, location: medellin, arrival_date: Date.parse('02-12-2017'), departure_date: Date.parse('30-12-2017'))
balboa_bogota = ScheduleItem.create!(cohort: balboa, location: bogota, arrival_date: Date.parse('30-12-2017'), departure_date: Date.parse('27-01-2018'))
balboa_mexico_city = ScheduleItem.create!(cohort: balboa, location: mexico_city, arrival_date: Date.parse('27-01-2018'), departure_date: Date.parse('03-03-2018'))


meraki_valencia = ScheduleItem.create!(cohort: meraki, location: valencia, arrival_date: Date.parse('26-08-2017'), departure_date: Date.parse('30-09-2017'))
meraki_kl = ScheduleItem.create!(cohort: meraki, location: kl, arrival_date: Date.parse('30-09-2017'), departure_date: Date.parse('04-11-2017'))
meraki_chiangmai = ScheduleItem.create!(cohort: meraki, location: changmai, arrival_date: Date.parse('04-11-2017'), departure_date: Date.parse('02-12-2017'))
meraki_kyoto = ScheduleItem.create!(cohort: meraki, location: kyoto, arrival_date: Date.parse('02-12-2017'), departure_date: Date.parse('30-12-2017'))

kublai_sofia = ScheduleItem.create!(cohort: kublai, location: sofia, arrival_date: Date.parse('26-08-2017'), departure_date: Date.parse('30-09-2017'))
kublai_ba = ScheduleItem.create!(cohort: kublai, location: buenos_aires, arrival_date: Date.parse('30-09-2017'), departure_date: Date.parse('04-11-2017'))
kublai_cordoba = ScheduleItem.create!(cohort: kublai, location: cordoba, arrival_date: Date.parse('04-11-2017'), departure_date: Date.parse('02-12-2017'))
kublai_santiago = ScheduleItem.create!(cohort: kublai, location: santiago, arrival_date: Date.parse('02-12-2017'), departure_date: Date.parse('30-12-2017'))
kublai_Lima = ScheduleItem.create!(cohort: kublai, location: lima, arrival_date: Date.parse('30-12-2017'), departure_date: Date.parse('27-01-2018'))


kaizen_chiangmai = ScheduleItem.create!(cohort: kaizen, location: changmai, arrival_date: Date.parse('26-08-2017'), departure_date: Date.parse('30-09-2017'))
kaizen_kyoto = ScheduleItem.create!(cohort: kaizen, location: kyoto, arrival_date: Date.parse('30-09-2017'), departure_date: Date.parse('04-11-2017'))
kaizen_kl = ScheduleItem.create!(cohort: kaizen, location: kl, arrival_date: Date.parse('04-11-2017'), departure_date: Date.parse('02-12-2017'))
kaizen_lima = ScheduleItem.create!(cohort: kaizen, location: lima, arrival_date: Date.parse('02-12-2017'), departure_date: Date.parse('30-12-2017'))
kaizen_medellin = ScheduleItem.create!(cohort: kaizen, location: medellin, arrival_date: Date.parse('30-12-2017'), departure_date: Date.parse('27-01-2018'))
kaizen_bogota = ScheduleItem.create!(cohort: kaizen, location: bogota, arrival_date: Date.parse('27-01-2018'), departure_date: Date.parse('03-03-2018'))
kaizen_cdmx = ScheduleItem.create!(cohort: kaizen, location: mexico_city, arrival_date: Date.parse('03-03-2018'), departure_date: Date.parse('31-03-2018'))

veritas_belgrade = ScheduleItem.create!(cohort: veritas, location: belgrade, arrival_date: Date.parse('26-08-2017'), departure_date: Date.parse('30-09-2017'))
veritas_marrakesh = ScheduleItem.create!(cohort: veritas, location: marrakesh, arrival_date: Date.parse('30-09-2017'), departure_date: Date.parse('04-11-2017'))
veritas_ba = ScheduleItem.create!(cohort: veritas, location: buenos_aires, arrival_date: Date.parse('04-11-2017'), departure_date: Date.parse('02-12-2017'))
veritas_cordoba = ScheduleItem.create!(cohort: veritas, location: cordoba, arrival_date: Date.parse('02-12-2017'), departure_date: Date.parse('30-12-2017'))
veritas_lima = ScheduleItem.create!(cohort: veritas, location: lima, arrival_date: Date.parse('30-12-2017'), departure_date: Date.parse('27-01-2018'))
veritas_medellin = ScheduleItem.create!(cohort: veritas, location: medellin, arrival_date: Date.parse('27-01-2018'), departure_date: Date.parse('03-03-2018'))
veritas_bogota = ScheduleItem.create!(cohort: veritas, location: bogota, arrival_date: Date.parse('03-03-2018'), departure_date: Date.parse('31-03-2018'))
veritas_cdmx = ScheduleItem.create!(cohort: veritas, location: mexico_city, arrival_date: Date.parse('31-03-2018'), departure_date: Date.parse('28-04-2018'))

earhart_hanoi = ScheduleItem.create!(cohort: earhart, location: hanoi, arrival_date: Date.parse('26-08-2017'), departure_date: Date.parse('30-09-2017'))
earhart_chiangmai = ScheduleItem.create!(cohort: earhart, location: changmai, arrival_date: Date.parse('30-09-2017'), departure_date: Date.parse('04-11-2017'))
earhart_kl = ScheduleItem.create!(cohort: earhart, location: kl, arrival_date: Date.parse('04-11-2017'), departure_date: Date.parse('02-12-2017'))
earhart_ba = ScheduleItem.create!(cohort: earhart, location: buenos_aires, arrival_date: Date.parse('02-12-2017'), departure_date: Date.parse('30-12-2017'))
earhart_cordoba = ScheduleItem.create!(cohort: earhart, location: cordoba, arrival_date: Date.parse('30-12-2017'), departure_date: Date.parse('27-01-2018'))
earhart_lima = ScheduleItem.create!(cohort: earhart, location: lima, arrival_date: Date.parse('27-01-2018'), departure_date: Date.parse('03-03-2018'))
earhart_medellin = ScheduleItem.create!(cohort: earhart, location: medellin, arrival_date: Date.parse('03-03-2018'), departure_date: Date.parse('31-03-2018'))
earhart_bogota = ScheduleItem.create!(cohort: earhart, location: bogota, arrival_date: Date.parse('31-03-2018'), departure_date: Date.parse('28-04-2018'))
earhart_cdmx = ScheduleItem.create!(cohort: earhart, location: mexico_city, arrival_date: Date.parse('28-04-2018'), departure_date: Date.parse('26-05-2018'))

yugen_prague = ScheduleItem.create!(cohort: yugen, location: prague, arrival_date: Date.parse('26-08-2017'), departure_date: Date.parse('30-09-2017'))
yugen_lisbon = ScheduleItem.create!(cohort: yugen, location: lisbon, arrival_date: Date.parse('30-09-2017'), departure_date: Date.parse('04-11-2017'))
yugen_kyoto = ScheduleItem.create!(cohort: yugen, location: kyoto, arrival_date: Date.parse('04-11-2017'), departure_date: Date.parse('02-12-2017'))
yugen_kl = ScheduleItem.create!(cohort: yugen, location: kl, arrival_date: Date.parse('02-12-2017'), departure_date: Date.parse('30-12-2017'))
yugen_chiangmai = ScheduleItem.create!(cohort: yugen, location: changmai, arrival_date: Date.parse('30-12-2017'), departure_date: Date.parse('27-01-2018'))
yugen_ba = ScheduleItem.create!(cohort: yugen, location: buenos_aires, arrival_date: Date.parse('27-01-2018'), departure_date: Date.parse('03-03-2018'))
yugen_cordoba = ScheduleItem.create!(cohort: yugen, location: cordoba, arrival_date: Date.parse('03-03-2018'), departure_date: Date.parse('31-03-2018'))
yugen_lima = ScheduleItem.create!(cohort: yugen, location: lima, arrival_date: Date.parse('31-03-2018'), departure_date: Date.parse('28-04-2018'))
yugen_medellin = ScheduleItem.create!(cohort: yugen, location: medellin, arrival_date: Date.parse('28-04-2018'), departure_date: Date.parse('26-05-2018'))
yugen_bogota = ScheduleItem.create!(cohort: yugen, location: bogota, arrival_date: Date.parse('26-05-2018'), departure_date: Date.parse('30-06-2018'))
yugen_cdmx = ScheduleItem.create!(cohort: yugen, location: mexico_city, arrival_date: Date.parse('30-06-2018'), departure_date: Date.parse('28-07-2018'))

sonder_split = ScheduleItem.create!(cohort: sonder, location: split, arrival_date: Date.parse('26-08-2017'), departure_date: Date.parse('30-09-2017'))
sonder_prague = ScheduleItem.create!(cohort: sonder, location: prague, arrival_date: Date.parse('30-09-2017'), departure_date: Date.parse('04-11-2017'))
sonder_lisbon = ScheduleItem.create!(cohort: sonder, location: lisbon, arrival_date: Date.parse('04-11-2017'), departure_date: Date.parse('02-12-2017'))
sonder_sofia = ScheduleItem.create!(cohort: sonder, location: sofia, arrival_date: Date.parse('02-12-2017'), departure_date: Date.parse('30-12-2017'))
sonder_marrakesh = ScheduleItem.create!(cohort: sonder, location: marrakesh, arrival_date: Date.parse('30-12-2017'), departure_date: Date.parse('27-01-2018'))
sonder_capetown = ScheduleItem.create!(cohort: sonder, location: capetown, arrival_date: Date.parse('27-01-2018'), departure_date: Date.parse('03-03-2018'))
sonder_ba = ScheduleItem.create!(cohort: sonder, location: buenos_aires, arrival_date: Date.parse('03-03-2018'), departure_date: Date.parse('31-03-2018'))
sonder_cordoba = ScheduleItem.create!(cohort: sonder, location: cordoba, arrival_date: Date.parse('31-03-2018'), departure_date: Date.parse('28-04-2018'))
sonder_lima = ScheduleItem.create!(cohort: sonder, location: lima, arrival_date: Date.parse('28-04-2018'), departure_date: Date.parse('26-05-2018'))
sonder_medellin = ScheduleItem.create!(cohort: sonder, location: medellin, arrival_date: Date.parse('26-05-2018'), departure_date: Date.parse('30-06-2018'))
sonder_bogota = ScheduleItem.create!(cohort: sonder, location: bogota, arrival_date: Date.parse('30-06-2018'), departure_date: Date.parse('28-07-2018'))
sonder_cdmx = ScheduleItem.create!(cohort: sonder, location: mexico_city, arrival_date: Date.parse('28-07-2018'), departure_date: Date.parse('25-08-2018'))

mangata_split = ScheduleItem.create!(cohort: mangata, location: split, arrival_date: Date.parse('30-09-2017'), departure_date: Date.parse('04-11-2017'))
mangata_prague = ScheduleItem.create!(cohort: mangata, location: prague, arrival_date: Date.parse('04-11-2017'), departure_date: Date.parse('02-12-2017'))
mangata_lisbon = ScheduleItem.create!(cohort: mangata, location: lisbon, arrival_date: Date.parse('02-12-2017'), departure_date: Date.parse('30-12-2017'))
mangata_kyoto = ScheduleItem.create!(cohort: mangata, location: kyoto, arrival_date: Date.parse('30-12-2017'), departure_date: Date.parse('27-01-2018'))
mangata_chaingmai = ScheduleItem.create!(cohort: mangata, location: changmai, arrival_date: Date.parse('27-01-2018'), departure_date: Date.parse('03-03-2018'))
mangata_kl = ScheduleItem.create!(cohort: mangata, location: kl, arrival_date: Date.parse('03-03-2018'), departure_date: Date.parse('31-03-2018'))
mangata_buenos_aires = ScheduleItem.create!(cohort: mangata, location: buenos_aires, arrival_date: Date.parse('31-03-2018'), departure_date: Date.parse('28-04-2018'))
mangata_cordoba = ScheduleItem.create!(cohort: mangata, location: cordoba, arrival_date: Date.parse('28-04-2018'), departure_date: Date.parse('26-05-2018'))
mangata_lima = ScheduleItem.create!(cohort: mangata, location: lima, arrival_date: Date.parse('26-05-2018'), departure_date: Date.parse('30-06-2018'))
mangata_medellin = ScheduleItem.create!(cohort: mangata, location: medellin, arrival_date: Date.parse('30-06-2018'), departure_date: Date.parse('28-07-2018'))
mangata_bogota = ScheduleItem.create!(cohort: mangata, location: bogota, arrival_date: Date.parse('28-07-2018'), departure_date: Date.parse('25-08-2018'))
mangata_cdmx = ScheduleItem.create!(cohort: mangata, location: mexico_city, arrival_date: Date.parse('25-08-2018'), departure_date: Date.parse('29-09-2018'))
puts 'End Schedule Items'
################################## End Schedule Items  #######################################

################################## Transits  #######################################
puts 'Build Transits'
kl_to_thailand = Transit.create(date: Date.today + 30.days, title: 'KL to Chang Mai', departure_location_id: kl.id, arrival_location_id: changmai.id)
thailand_to_cambodia = Transit.create(date: Date.today + 60.days, title: 'Thailand to Cambodia', departure_location: changmai, arrival_location: phnompenh)
cambodia_to_croatia = Transit.create(date: Date.today + 90.days, title: 'Cambodia To Split', departure_location: phnompenh, arrival_location: split)
croatia_to_czech = Transit.create(date: Date.today + 120.days, title: 'Split To Prague', departure_location: split, arrival_location: prague)
czech_to_lisbon = Transit.create(date: Date.today + 150.days, title: 'Prague TO Lisbon', departure_location: prague, arrival_location: lisbon)

libertatem.transits << thailand_to_cambodia
libertatem.transits << kl_to_thailand
libertatem.transits << cambodia_to_croatia
libertatem.transits << croatia_to_czech
libertatem.transits << czech_to_lisbon



ba_to_cordoba = Transit.create(date: Date.parse('30-09-2017') , title: 'BA to Cordoba', departure_location_id: buenos_aires.id, arrival_location_id: cordoba.id)
cordoba_to_lima = Transit.create(date: Date.parse('04-11-2017') , title: 'Cordoba to Lima', departure_location_id: cordoba.id, arrival_location_id: lima.id)
lima_to_medellin = Transit.create(date: Date.parse('02-12-2017') , title: 'Lima to Medellin', departure_location_id: lima.id, arrival_location_id: medellin.id)
medellin_to_bogota = Transit.create(date: Date.parse('30-12-2017') , title: 'Medellin to Bogota', departure_location_id: medellin.id, arrival_location_id: bogota.id)
bogota_to_cdmx = Transit.create(date: Date.parse('27-01-2017') , title: 'Bogota to Mexico City ', departure_location_id: bogota.id, arrival_location_id: mexico_city.id)

balboa.transits << ba_to_cordoba
balboa.transits << cordoba_to_lima
balboa.transits << lima_to_medellin
balboa.transits << medellin_to_bogota
balboa.transits << bogota_to_cdmx


meraki_valencia_to_kl = Transit.create(date: Date.parse('30-09-2017') , title: 'Meraki - Valencia To Kuala Lumpur', departure_location_id: valencia.id, arrival_location_id: kl.id)
meraki_kl_to_cm = Transit.create(date: Date.parse('04-11-2017') , title: 'Meraki - Kuala Lumpur To Thailand', departure_location_id: kl.id, arrival_location_id: changmai.id)
meraki_chiangmai_to_kyoto = Transit.create(date: Date.parse('02-12-2017') , title: 'Meraki - Thailand To Japan', departure_location_id: kl.id, arrival_location_id: changmai.id)
meraki.transits << [meraki_valencia_to_kl, meraki_kl_to_cm, meraki_chiangmai_to_kyoto]


kublai_sofia_to_ba = Transit.create(date: Date.parse('30-09-2017') , title: 'Kublai - Sofia to Buenos Aires', departure_location_id: sofia.id, arrival_location_id: buenos_aires.id)
kublai_ba_to_cordoba = Transit.create(date: Date.parse('04-11-2017') , title: 'Kublai - Buenos Aires To Cordoba', departure_location_id: buenos_aires.id, arrival_location_id: cordoba.id)
kublai_cordoba_to_santiago = Transit.create(date: Date.parse('02-12-2017') , title: 'Kublai - Cordoba To Santiago', departure_location_id: cordoba.id, arrival_location_id: santiago.id)
kublai_santiago_lima = Transit.create(date: Date.parse('30-12-2017') , title: 'Kublai - Santiago To Lima', departure_location_id: santiago.id, arrival_location_id: lima.id)
kublai.transits << [kublai_sofia_to_ba, kublai_ba_to_cordoba, kublai_cordoba_to_santiago, kublai_santiago_lima]


kaizen_chiangmai_to_kyoto = Transit.create(date: Date.parse('30-09-2017') , title: 'Kaizen - Thailand To Japan', departure_location_id: changmai.id, arrival_location_id: kyoto.id)
kaizen_kyoto_to_kl = Transit.create(date: Date.parse('04-11-2017') , title: 'Kaizen - Japan To Malaysia', departure_location_id: changmai.id, arrival_location_id: kyoto.id)
kaizen_kl_to_lima = Transit.create(date: Date.parse('02-12-2017') , title: 'Kaizen - Malaysia To Peru', departure_location_id: kyoto.id, arrival_location_id: lima.id)
kaizen_lima_to_medellin = Transit.create(date: Date.parse('30-12-2017') , title: 'Kaizen - Peru To Colombia', departure_location_id: lima.id, arrival_location_id: medellin.id)
kaizen_medellin_to_bogota = Transit.create(date: Date.parse('27-01-2018') , title: 'Kaizen - Medellin To Bogota', departure_location_id: medellin.id, arrival_location_id: bogota.id)
kaizen_bogota_to_mexico = Transit.create(date: Date.parse('03-03-2018') , title: 'Kaizen - Colombia To Mexico', departure_location_id: medellin.id, arrival_location_id: bogota.id)
kaizen.transits << [kaizen_chiangmai_to_kyoto, kaizen_kyoto_to_kl, kaizen_kl_to_lima, kaizen_lima_to_medellin, kaizen_medellin_to_bogota, kaizen_bogota_to_mexico]

veritas_belgrade_to_marrakesh = Transit.create(date: Date.parse('30-09-2017') , title: 'Veritas - Belgrade To Morocco', departure_location_id: belgrade.id, arrival_location_id: marrakesh.id)
veritas_marrakesh_to_ba = Transit.create(date: Date.parse('04-11-2017') , title: 'Veritas - Morocco Argentina', departure_location_id: marrakesh.id, arrival_location_id: buenos_aires.id)
veritas_ba_to_cordoba = Transit.create(date: Date.parse('02-12-2017') , title: 'Veritas - Buenos Aires To Cordoba', departure_location_id: buenos_aires.id, arrival_location_id: cordoba.id)
veritas_cordoba_to_lima = Transit.create(date: Date.parse('30-12-2017') , title: 'Veritas - Argentina to Peru', departure_location_id: cordoba.id, arrival_location_id: lima.id)
veritas_lima_to_medellin = Transit.create(date: Date.parse('27-01-2017') , title: 'Veritas - Peru To Colombia', departure_location_id: lima.id, arrival_location_id: medellin.id)
veritas_medellin_to_bogota = Transit.create(date: Date.parse('03-03-2017') , title: 'Veritas - Medellin To Bogota', departure_location_id: medellin.id, arrival_location_id: bogota.id)
veritas_bogota_to_cdmx = Transit.create(date: Date.parse('31-03-2017') , title: 'Veritas - Colombia To Mexico', departure_location_id: bogota.id, arrival_location_id: mexico_city.id)
veritas.transits << [veritas_belgrade_to_marrakesh, veritas_marrakesh_to_ba, veritas_ba_to_cordoba, veritas_cordoba_to_lima, veritas_lima_to_medellin, veritas_medellin_to_bogota, veritas_bogota_to_cdmx]

earhart_hanoi_to_cm = Transit.create(date: Date.parse('30-09-2017') , title: 'Earhart - Vietnam To Thailand', departure_location_id: hanoi.id, arrival_location_id: changmai.id)
earhart_chiangmai_to_kl = Transit.create(date: Date.parse('04-11-2017') , title: 'Earhart - Thailand To Malaysia', departure_location_id: changmai.id, arrival_location_id: kl.id)
earhart_kl_to_ba = Transit.create(date: Date.parse('02-12-2017') , title: 'Earhart - Malaysia To Argentina', departure_location_id: kl.id, arrival_location_id: buenos_aires.id)
earhart_ba_to_cordoba = Transit.create(date: Date.parse('30-12-2017') , title: 'Earhart - Buenos Aires To Cordoba', departure_location_id: buenos_aires.id, arrival_location_id: cordoba.id)
earhart_cordoba_to_lima = Transit.create(date: Date.parse('27-01-2018') , title: 'Earhart - Argentina To Peru', departure_location_id: cordoba.id, arrival_location_id: lima.id)
earhart_lima_to_medellin = Transit.create(date: Date.parse('03-03-2018') , title: 'Earhart - Peru To Colombia', departure_location_id: lima.id, arrival_location_id: medellin.id)
earhart_medellin_to_bogota = Transit.create(date: Date.parse('31-03-2018') , title: 'Earhart - Medellin To Bogota', departure_location_id: medellin.id, arrival_location_id: bogota.id)
earhart_bogota_to_mexico = Transit.create(date: Date.parse('28-04-2018') , title: 'Earhart - Colombia to Mexico', departure_location_id: bogota.id, arrival_location_id: mexico_city.id)
earhart.transits << [earhart_hanoi_to_cm, earhart_chiangmai_to_kl, earhart_kl_to_ba, earhart_ba_to_cordoba, earhart_cordoba_to_lima, earhart_lima_to_medellin, earhart_medellin_to_bogota, earhart_bogota_to_mexico]

yugen_prague_to_lisbon = Transit.create(date: Date.parse('30-09-2017') , title: 'Yugen - Czech To Portugal ', departure_location_id: prague.id, arrival_location_id: lisbon.id)
yugen_lisbon_to_kyoto = Transit.create(date: Date.parse('04-11-2017') , title: 'Yugen - Portugal To Japan ', departure_location_id: lisbon.id, arrival_location_id: kyoto.id)
yugen_kyoto_to_kl = Transit.create(date: Date.parse('02-12-2017') , title: 'Yugen - Japan To Malaysia ', departure_location_id: kyoto.id, arrival_location_id: kl.id)
yugen_kl_to_cm = Transit.create(date: Date.parse('30-12-2017') , title: 'Yugen - Malaysia To Thailand', departure_location_id: kl.id, arrival_location_id: changmai.id)
yugen_chiangmai_to_ba = Transit.create(date: Date.parse('27-01-2018') , title: 'Yugen - Thailand To Argentina ', departure_location_id: changmai.id, arrival_location_id: buenos_aires.id)
yugen_ba_to_cordoba = Transit.create(date: Date.parse('03-03-2018') , title: 'Yugen - Buenos Aires To Cordoba ', departure_location_id: buenos_aires.id, arrival_location_id: cordoba.id)
yugen_cordob_to_lima = Transit.create(date: Date.parse('31-03-2018') , title: 'Yugen - Argentina To Peru', departure_location_id: cordoba.id, arrival_location_id: lima.id)
yugen_lima_to_medellin = Transit.create(date: Date.parse('28-04-2018') , title: 'Yugen - Peru To Colombia ', departure_location_id: lima.id, arrival_location_id: medellin.id)
yugen_medellin_to_bogota = Transit.create(date: Date.parse('26-05-2018') , title: 'Yugen - Medellin To Bogota', departure_location_id: medellin.id, arrival_location_id: bogota.id)
yugen_bogota_to_mexico = Transit.create(date: Date.parse('30-06-2018') , title: 'Yugen - Colombia To Mexico', departure_location_id: bogota.id, arrival_location_id: mexico_city.id)
yugen.transits << [yugen_prague_to_lisbon, yugen_lisbon_to_kyoto, yugen_kyoto_to_kl, yugen_kl_to_cm, yugen_chiangmai_to_ba, yugen_ba_to_cordoba, yugen_cordob_to_lima, yugen_lima_to_medellin, yugen_medellin_to_bogota, yugen_bogota_to_mexico]


sonder_split_to_prague = Transit.create(date: Date.parse('30-09-2017') , title: 'Sonder - Croatia To Czech ', departure_location_id: split.id, arrival_location_id: prague.id)
sonder_prague_to_lisbon = Transit.create(date: Date.parse('04-11-2017') , title: 'Sonder - Czech To Portugal ', departure_location_id: prague.id, arrival_location_id: lisbon.id)
sonder_lisbon_to_sofia = Transit.create(date: Date.parse('02-12-2017') , title: 'Sonder - Portugal To Bulgaria ', departure_location_id: lisbon.id, arrival_location_id: sofia.id)
sonder_sofia_to_marrakesh = Transit.create(date: Date.parse('30-12-2017') , title: 'Sonder - Bulgaria To Morocco ', departure_location_id: sofia.id, arrival_location_id: marrakesh.id)
sonder_marrakesh_to_capetown = Transit.create(date: Date.parse('27-01-2018') , title: 'Sonder - Morocco To South Africa', departure_location_id: marrakesh.id, arrival_location_id: capetown.id)
sonder_capetown_to_ba = Transit.create(date: Date.parse('03-03-2018') , title: 'Sonder - South Africa To Argentina', departure_location_id: capetown.id, arrival_location_id: buenos_aires.id)
sonder_ba_to_cordoba = Transit.create(date: Date.parse('30-03-2018') , title: 'Sonder - Buenos Aires To Cordoba', departure_location_id: buenos_aires.id, arrival_location_id: cordoba.id)
sonder_cordoba_to_lima = Transit.create(date: Date.parse('28-04-2018') , title: 'Sonder - Argentina To Peru', departure_location_id: cordoba.id, arrival_location_id: lima.id)
sonder_lima_to_medellin = Transit.create(date: Date.parse('25-05-2018') , title: 'Sonder - Peru To Colombia', departure_location_id: lima.id, arrival_location_id: medellin.id)
sonder_medellin_to_bogota = Transit.create(date: Date.parse('30-06-2018') , title: 'Sonder - Medellin To Bogota', departure_location_id: medellin.id, arrival_location_id: bogota.id)
sonder_bogota_to_mexico = Transit.create(date: Date.parse('28-07-2018') , title: 'Sonder - Colombia To Mexico', departure_location_id: bogota.id, arrival_location_id: mexico_city.id)
sonder.transits << [sonder_split_to_prague, sonder_prague_to_lisbon, sonder_lisbon_to_sofia, sonder_sofia_to_marrakesh, sonder_marrakesh_to_capetown, sonder_capetown_to_ba, sonder_ba_to_cordoba, sonder_cordoba_to_lima, sonder_lima_to_medellin, sonder_medellin_to_bogota, sonder_bogota_to_mexico]

puts 'End Build Transits'
################################## End Transits  #######################################

################################## Side Trips  #######################################
puts 'Build SideTrips'
borneo = SideTrip.create!(cohort: libertatem, title: "Libertatem To Borneo", start_date: Date.today + 37.days, end_date: Date.today + 44.days, is_public: true, creator_id: zack.id)
borneo.users << [trabka, andrea]
borneo.locations << sandakan
borneo_side_trip_departure = Transit.create(date: Date.today + 37.days, title: 'KL to Borneo', departure_location: kl, arrival_location: sandakan)
borneo.transits << borneo_side_trip_departure
borneo_side_trip_departure = Transit.create(date: Date.today + 44.days, title: 'Return to KL', departure_location: sandakan, arrival_location: kl)
borneo.transits << borneo_side_trip_departure
borneo.lodgings << borneo_travel_company_lodging


balboa_st_1 = SideTrip.create!(cohort: balboa, title: "Balboa To Mendoza", start_date: Date.today + 37.days, end_date: Date.today + 44.days, is_public: true, creator_id: anastasia.id)
balboa_st_1.users << [grace, chris_h, brandon_c]
puts 'End Build SideTrips'

################################## Tracks #######################################
puts 'Build Tracks'
puts 'Track 1'
undiscovered_kl_track = Track.create!(name: "Undiscovered KL", description: 'Find out all about the undiscovered KL', cohort: libertatem, location: kl)
undiscovered_kl_track.users << [andrea, trabka]
undiscovered_kl_track_event_1 = Event.create!(title: "Hidden Gem Discovery", date: Date.today + 11.days, start_time: Time.now, description: "Find out about one of the most amazing hidden Gems in KL", location: kl, cohort: libertatem, event_type: 'track', cost: 15)
undiscovered_kl_track_event_1.users << undiscovered_kl_track.users
undiscovered_kl_track.events << undiscovered_kl_track_event_1
andrea.events << undiscovered_kl_track_event_1
trabka.events << undiscovered_kl_track_event_1
puts 'End Track 1'

puts 'Track 2'
kl_foodies_track = Track.create!(name: "KL Foodies", description: 'Learn All About the Food Scene In KL', cohort: libertatem, location: kl)
kl_foodies_track.users << [zack, geordan]
kl_foodies_track_event_1 = Event.create!(title: "Illegal Chineese", date: Date.today + 14.days, start_time: Time.now, description: "Find out about one of the most amazing hidden Food Gems in KL", location: kl, cohort: libertatem, event_type: 'track', cost: 30)
kl_foodies_track_event_1.users << kl_foodies_track.users
kl_foodies_track.events << kl_foodies_track_event_1
puts 'End Track 2'

puts 'Track 3'
kl_temples_track = Track.create!(name: "KL Temples", description: 'Tour All The Amazing Temples in KL', cohort: libertatem, location: kl)
kl_temples_track.users = [gemma, chech]
kl_temples_track_event_1 = Event.create!(title: "Temple Walking Tour", date: Date.today + 17.days, start_time: Time.now, description: "Over the course of a few hours, you will walk through some cool neighborhoods and see the inside of some awesome temples", location: kl, cohort: libertatem, event_type: 'track', cost: 25)
kl_temples_track_event_1.users << kl_temples_track.users
kl_temples_track.events << kl_temples_track_event_1
puts 'End Track 3'

thailand_mushrooms_track = Track.create!(name: "Thailand Mushrooms", description: 'Find out all about the history of Musrooms in Thailand', cohort: libertatem, location: changmai)
thailand_temples_track = Track.create!(name: "Thailand Temples", description: 'Tour All The Amazing Temples in ChangMai', cohort: libertatem, location: changmai)
thailand_history_track = Track.create!(name: "History of Thai", description: 'Undiscovered wars to lost archives, learn all about the history of Thailand', cohort: libertatem, location: changmai)


puts 'Balboa Track 1'
undiscovered_ba_track = Track.create!(name: "Undiscovered BA", description: 'Find out all about the undiscovered BA', cohort: balboa, location: buenos_aires)
undiscovered_ba_track.users << [aj, brandon_c, chris_h]
undiscovered_ba_track_event_1 = Event.create!(title: "Hidden Gem Discovery", date: Date.today + 11.days, start_time: Time.now, description: "Find out about one of the most amazing hidden Gems in KL", location: kl, cohort: libertatem, event_type: 'track', cost: 15)
undiscovered_ba_track_event_1.users << undiscovered_ba_track.users
undiscovered_ba_track.events << undiscovered_ba_track_event_1
aj.events << undiscovered_ba_track_event_1
brandon_c.events << undiscovered_ba_track_event_1
chris_h.events << undiscovered_ba_track_event_1
puts 'Balboa End Track 1'


puts 'Balboa Track 2'
ba_foodies_track = Track.create!(name: "BA Foodies", description: 'Learn All About the Food Scene In BA', cohort: balboa, location: buenos_aires)
ba_foodies_track.users << [annabel, grace]
ba_foodies_track_event_1 = Event.create!(title: "Steaks by Luis", date: Date.today + 14.days, start_time: Time.now, description: "Find out about one of the most amazing hidden Food Gems in KL", location: kl, cohort: libertatem, event_type: 'track', cost: 30)
ba_foodies_track_event_1.users << kl_foodies_track.users
ba_foodies_track.events << kl_foodies_track_event_1
annabel.events << ba_foodies_track_event_1
grace.events << ba_foodies_track_event_1
puts 'Balboa End Track 2'

puts 'End Build Tracks'




################################## End Tracks #######################################

##################################  Housings  #######################################
maple_suites_101 = Housing.create!(name: 'Maples Suites 101', rooms: 2, bathrooms: 2, street_number: '1', location: kl, street_name: 'Changkat Raja Chulan', postal_code: 50200, neighborhood: 'Bukit Bingtang', unit: '101', full_address: '1, Changkat Raja Chulan, Bukit Ceylon, 50200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur, Malaysia')
maple_suites_102 = Housing.create!(name: 'Maples Suites 102', rooms: 2, bathrooms: 2, street_number: '1', location:kl, street_name: 'Changkat Raja Chulan', postal_code: 50200, neighborhood: 'Bukit Bingtang', unit: '102', full_address: '1, Changkat Raja Chulan, Bukit Ceylon, 50200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur, Malaysia')
maple_suites_103 = Housing.create!(name: 'Maples Suites 103', rooms: 2, bathrooms: 2, street_number: '1', location:kl, street_name: 'Changkat Raja Chulan', postal_code: 50200, neighborhood: 'Bukit Bingtang', unit: '103', full_address: '1, Changkat Raja Chulan, Bukit Ceylon, 50200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur, Malaysia')
maple_suites_104 = Housing.create!(name: 'Maples Suites 104', rooms: 2, bathrooms: 2, street_number: '1', location:kl, street_name: 'Changkat Raja Chulan', postal_code: 50200, neighborhood: 'Bukit Bingtang', unit: '104', full_address: '1, Changkat Raja Chulan, Bukit Ceylon, 50200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur, Malaysia')

loyfa_1 = Housing.create!(name: 'Loyfa 1', rooms: 1, bathrooms: 1, street_number: '14-1',
                                  location:changmai, street_name: 'Moo 8', postal_code: 84280,
                                  neighborhood: 'Bukit Bingtang', unit: '1', full_address: '14/1 Moo 8, Srithanu Beach, Koh Phangan, Surat Thani Koh Phangan, Tambon Ko Pha-ngan, Amphoe Ko Pha-ngan, Chang Wat Surat Thani 84280, Thailand')

loyfa_2 = Housing.create!(name: 'Loyfa 2', rooms: 1, bathrooms: 1, street_number: '14-1',
                                  location:changmai, street_name: 'Moo 8', postal_code: 84280,
                                  neighborhood: 'Bukit Bingtang', unit: '2', full_address: '14/1 Moo 8, Srithanu Beach, Koh Phangan, Surat Thani Koh Phangan, Tambon Ko Pha-ngan, Amphoe Ko Pha-ngan, Chang Wat Surat Thani 84280, Thailand')
loyfa_3 = Housing.create!(name: 'Loyfa 3', rooms: 1, bathrooms: 1, street_number: '14-1',
                                  location:changmai, street_name: 'Moo 8', postal_code: 84280,
                                  neighborhood: 'Bukit Bingtang', unit: '3', full_address: '14/1 Moo 8, Srithanu Beach, Koh Phangan, Surat Thani Koh Phangan, Tambon Ko Pha-ngan, Amphoe Ko Pha-ngan, Chang Wat Surat Thani 84280, Thailand')
loyfa_4 = Housing.create!(name: 'Loyfa 1', rooms: 1, bathrooms: 1, street_number: '14-1',
                                  location:changmai, street_name: 'Moo 8', postal_code: 84280,
                                  neighborhood: 'Bukit Bingtang', unit: '4', full_address: '14/1 Moo 8, Srithanu Beach, Koh Phangan, Surat Thani Koh Phangan, Tambon Ko Pha-ngan, Amphoe Ko Pha-ngan, Chang Wat Surat Thani 84280, Thailand')

green_mansion_1 = Housing.create!(name: 'Green Mansion 11', rooms: 3, bathrooms: 2, street_number: '6', location: phnompenh, street_name: 'Samdach Preah Sokun Meanbon St. ', postal_code: 178, neighborhood: 'Kahn Dunh Penh', unit: '11', full_address: '#6, Samdach Preah Sokun Meanbon St. (178), Phnom Penh, Cambodia')
green_mansion_1.tags << [natural_light, close_to_workspace, good_wifi]
green_mansion_2 = Housing.create!(name: 'Green Mansion 12', rooms: 2, bathrooms: 2, street_number: '6', location: phnompenh, street_name: 'Samdach Preah Sokun Meanbon St. ', postal_code: 178, neighborhood: 'Kahn Dunh Penh', unit: '12', full_address: '#6, Samdach Preah Sokun Meanbon St. (178), Phnom Penh, Cambodia')
green_mansion_2.tags << [close_to_workspace, good_wifi]
green_mansion_3 = Housing.create!(name: 'Green Mansion 13', rooms: 1, bathrooms: 1, street_number: '6', location: phnompenh, street_name: 'Samdach Preah Sokun Meanbon St. ', postal_code: 178, neighborhood: 'Kahn Dunh Penh', unit: '13', full_address: '#6, Samdach Preah Sokun Meanbon St. (178), Phnom Penh, Cambodia')
green_mansion_3.tags << [full_kitchen, close_to_workspace, good_wifi, single_bedroom]

garden_mansion_1 = Housing.create!(name: 'Garden Mansion 445', rooms: 1, bathrooms: 1, street_number: '9', location: phnompenh, street_name: 'Ke Nou St.', postal_code: 178, neighborhood: 'Kahn Dunh Penh', unit: '445', full_address: 'Ke Nou St. (9), Phnom Penh, Cambodia')
garden_mansion_1.tags << [close_to_other_housing, city_center, good_wifi]
garden_mansion_2 = Housing.create!(name: 'Garden Mansion 456', rooms: 1, bathrooms: 1, street_number: '9', location: phnompenh, street_name: 'Ke Nou St.', postal_code: 178, neighborhood: 'Kahn Dunh Penh', unit: '446', full_address: 'Ke Nou St. (9), Phnom Penh, Cambodia')
garden_mansion_2.tags << [close_to_other_housing, city_center, good_wifi, natural_light]

living_252_1 = Housing.create!(name: '252 Boutique 201', rooms: 2, bathrooms: 2, street_number: '#11', location: phnompenh, street_name: 'Street 252', postal_code: 178, neighborhood: 'Kahn Dunh Penh', unit: '201', full_address: 'Street 252 #11, Phnom Penh, Cambodia')
living_252_1.tags << [modern, full_kitchen, close_to_workspace]


#balboa housing#

cordoba_mansion_1 = Housing.create!(name: 'Cordoba Mansion 11', rooms: 3, bathrooms: 2, street_number: '6', location: cordoba, street_name: '1 de Julio', postal_code: "00874", neighborhood: 'Cordoba', unit: '11', full_address: '#6, 1 de Julio., Cordoba, Argentina 00874')
cordoba_mansion_1.tags << [natural_light, close_to_workspace, good_wifi]
cordoba_mansion_2 = Housing.create!(name: 'Cordoba Mansion 12', rooms: 2, bathrooms: 2, street_number: '6', location: cordoba, street_name: '1 de Julio ', postal_code: "00874", neighborhood: 'Cordoba', unit: '12', full_address: '#6, 1 de Julio., Cordoba, Argentina 00874')
cordoba_mansion_2.tags << [close_to_workspace, good_wifi]
cordoba_mansion_3 = Housing.create!(name: 'Cordoba Mansion 13', rooms: 1, bathrooms: 1, street_number: '6', location: cordoba, street_name: '1 de Julio', postal_code: "00874", neighborhood: 'Cordoba', unit: '13', full_address: '#6, 1 de Julio., Cordoba, Argentina 00874')
cordoba_mansion_3.tags << [full_kitchen, close_to_workspace, good_wifi, single_bedroom]

garden_mansion_1 = Housing.create!(name: 'Argentina Mansion 445', rooms: 1, bathrooms: 1, street_number: '9', location: cordoba, street_name: 'Avenida Indepencia', postal_code: "00874", neighborhood: 'Cordoba', unit: '445', full_address: '#9, Avenida Indepencia, Cordoba, Argentina 00874')
garden_mansion_1.tags << [close_to_other_housing, city_center, good_wifi]
garden_mansion_2 = Housing.create!(name: 'Argentina Mansion 456', rooms: 1, bathrooms: 1, street_number: '9', location: cordoba, street_name: 'Avenida Indepencia', postal_code: "00874", neighborhood: 'Cordoba', unit: '446', full_address: '#9, Avenida Indepencia, Cordoba, Argentina 00874')
garden_mansion_2.tags << [close_to_other_housing, city_center, good_wifi, natural_light]

cordoba_252_1 = Housing.create!(name: 'Cordoba Boutique 201', rooms: 2, bathrooms: 2, street_number: '#11', location: cordoba, street_name: 'Street 252', postal_code: "00874", neighborhood: 'Cordoba', unit: '201', full_address: 'Street 252 #11, Cordoba, Argentina')
cordoba_252_1.tags << [modern, full_kitchen, close_to_workspace]


################################## End Build Housings  #######################################









