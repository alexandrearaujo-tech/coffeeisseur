# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([ name: 'Star Wars' ,  name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creating Users, Places, Categories, Experiences...'

Experience.destroy_all
User.destroy_all
Place.destroy_all
Category.destroy_all


5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: '123456')
end

# Creating Categories

Category.create!(name: "Workshops", icon: "fas fa-chalkboard-teacher")
Category.create!(name: "Competitions", icon: "fas fa-award")
Category.create!(name: "Tasting", icon: "fas fa-mug-hot")
Category.create!(name: "New Beans", icon: "fas fa-bullhorn")
Category.create!(name: "Coffee Talks", icon: "fas fa-handshake")
Category.create!(name: "Festivals", icon: "fas fa-calendar-alt")
Category.create!(name: "Mystery", icon: "fas fa-gift")

  # Category.create!(name: "roasting")
  # Category.create!(name: "meetup")


#create Places with real addressess
place1 = Place.create!(name: "Benjamin Coffee House",street: "Rua do Possolo 52", city: "Lisbon", photo: "", average_rating: "")

  Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"Workshops"), place: place1)
  Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"Competitions"), place: place1)

place2 = Place.create!(name: "COMOBA", street: "Rua de S. Paulo 99", city: "Lisbon", photo: "", average_rating: "")
  Experience.create!(name: "LisBOA ROA-sting!", category: Category.find_by(name:"Mystery"), place: place2)
  Experience.create!(name: "Coffee Country", category: Category.find_by(name:"Festivals"), place: place2)

place3 = Place.create!(name: "Cafe de Finca", street: "Rua Luís de Camões 112 A", city: "Lisbon", photo: "", average_rating: "")
  Experience.create!(name: "Meet Over a Cup", category: Category.find_by(name:"mystery"), place: place3)
  Experience.create!(name: "Taste of Finca", category: Category.find_by(name:"mystery"), place: place3)

place4 = Place.create!(name: "Copenhagen Coffee Lab (& Bakery)", street: "Campo de Santa Clara 136", city: "Lisbon", photo: "", average_rating: "")
  Experience.create!(name: "Group Drink Meetup", category: Category.find_by(name:"mystery"), place: place4)
  Experience.create!(name: "Nao Caoffe", category: Category.find_by(name:"mystery"), place: place4)

place5 = Place.create!(name: "Lovers Coffee", street: "Rua Nova da Piedade 10", city: "Lisbon", photo: "", average_rating: "")
  Experience.create!(name: "Now THIS is coffee", category: Category.find_by(name:"mystery"), place: place5)
  Experience.create!(name: "Coffee Lovers Group", category: Category.find_by(name:"mystery"), place: place5)

place6 = Place.create!(name: "Cafe Fantasia", street: "Escolas Gerais 34E", city: "Lisbon", photo: "", average_rating: "")
  Experience.create!(name: "Mystic Beans", category: Category.find_by(name:"mystery"), place: place6)
  Experience.create!(name: "Ethiopia Tasting", category: Category.find_by(name:"mystery"), place: place6)

place7 = Place.create!(name: "Coffee Best", street: "Rua Prior do Crato 1A", city: "Lisbon", photo: "", average_rating: "")
  Experience.create!(name: "Coffee on the Moon!", category: Category.find_by(name:"mystery"), place: place7)
  Experience.create!(name: "", category: Category.find_by(name:"mystery"), place: place7)

place8 = Place.create!(name: "Cafe Enamorado", street: "Escolas Gerais 34", city: "Lisbon", photo: "", average_rating: "")
  Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"mystery"), place: place8)
  Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"mystery"), place: place8)

place9 = Place.create!(name: "Lee's Cafe", street: "Rua Filinto Elisio 21", city: "Lisbon", photo: "", average_rating: "")
  Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"mystery"), place: place9)
  Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"mystery"), place: place9)

place10 = Place.create!(name: "Costa de Cafe", street: "Avenida da Liberdade 13", city: "Lisbon", photo: "", average_rating: "")
  Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"mystery"), place: place10)
  Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"mystery"), place: place10)



puts 'Done :)'
