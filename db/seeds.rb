# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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