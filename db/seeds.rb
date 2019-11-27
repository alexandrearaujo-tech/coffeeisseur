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

remote_photo_url_place = [
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1574863463/yhldnrjutaxsyfrdilqi.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1574863492/ebg0in801mwfpjs0nfml.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1574863506/ytqc4jghmkfr3azhusfq.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1574863545/t85lgulwwwxuezljj5rw.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1574863580/gxidfpmsd82a2gp8hwmj.jpg",
]

remote_photo_url_experience = [
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1574863441/fkilqvnf5dmwoaio3npu.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1574863475/zxdnaeppfoyfe32eplzq.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1574863526/renegkfmkv1fksugkvvr.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1574863557/xklgpuinczrnr0ix80yq.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1574863569/ldjlcns9nqcyuei5obz4.jpg",
]

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
Compliment.create!(name: "Food")
Compliment.create!(name: "Space")
Compliment.create!(name: "Coffee")
Compliment.create!(name: "Staff")



#create Places with real addressess
place1 = Place.create!(name: "Benjamin Coffee House",street: "Rua do Possolo 52", city: "Lisbon", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
experience1 = Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"Mystery"), place: place1, remote_photo_url: remote_photo_url_experience[rand(0..4)])
experience2 = Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"Mystery"), place: place1, remote_photo_url: remote_photo_url_experience[rand(0..4)])
booking1 = Booking.create!(date: Time.now.to_datetime, user_id: 1, experience_id: 1)
booking2 = Booking.create!(date: Time.now.to_datetime, user_id: 3, experience_id: 2)
10.times do
  Review.create!(content: "this is an amazing coffee", rating: rand(1..5), booking_id: rand(1..2), compliment_id: rand(1..4))
end


place2 = Place.create!(name: "COMOBA", street: "Rua de S. Paulo 99", city: "Lisbon", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "LisBOA ROA-sting!", category: Category.find_by(name:"Mystery"), place: place2, remote_photo_url: remote_photo_url_experience[rand(0..4)])
  Experience.create!(name: "Coffee Country", category: Category.find_by(name:"Festivals"), place: place2, remote_photo_url: remote_photo_url_experience[rand(0..4)])

place3 = Place.create!(name: "Cafe de Finca", street: "Rua Luís de Camões 112 A", city: "Lisbon", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Meet Over a Cup", category: Category.find_by(name:"Mystery"), place: place3, remote_photo_url: remote_photo_url_experience[rand(0..4)])
  Experience.create!(name: "Taste of Finca", category: Category.find_by(name:"Mystery"), place: place3, remote_photo_url: remote_photo_url_experience[rand(0..4)])

place4 = Place.create!(name: "Copenhagen Coffee Lab (& Bakery)", street: "Campo de Santa Clara 136", city: "Lisbon", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Group Drink Meetup", category: Category.find_by(name:"Mystery"), place: place4, remote_photo_url: remote_photo_url_experience[rand(0..4)])
  Experience.create!(name: "Nao Caoffe", category: Category.find_by(name:"Mystery"), place: place4, remote_photo_url: remote_photo_url_experience[rand(0..4)])

place5 = Place.create!(name: "Lovers Coffee", street: "Rua Nova da Piedade 10", city: "Lisbon", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Now THIS is coffee", category: Category.find_by(name:"Mystery"), place: place5, remote_photo_url: remote_photo_url_experience[rand(0..4)])
  Experience.create!(name: "Coffee Lovers Group", category: Category.find_by(name:"Mystery"), place: place5, remote_photo_url: remote_photo_url_experience[rand(0..4)])

place6 = Place.create!(name: "Cafe Fantasia", street: "Escolas Gerais 34E", city: "Lisbon", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Mystic Beans", category: Category.find_by(name:"Mystery"), place: place6, remote_photo_url: remote_photo_url_experience[rand(0..4)])
  Experience.create!(name: "Ethiopia Tasting", category: Category.find_by(name:"Mystery"), place: place6, remote_photo_url: remote_photo_url_experience[rand(0..4)])

place7 = Place.create!(name: "Coffee Best", street: "Rua Prior do Crato 1A", city: "Lisbon", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Coffee on the Moon!", category: Category.find_by(name:"Mystery"), place: place7, remote_photo_url: remote_photo_url_experience[rand(0..4)])
  Experience.create!(name: "", category: Category.find_by(name:"Mystery"), place: place7, remote_photo_url: remote_photo_url_experience[rand(0..4)])

place8 = Place.create!(name: "Cafe Enamorado", street: "Escolas Gerais 34", city: "Lisbon", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"Mystery"), place: place8, remote_photo_url: remote_photo_url_experience[rand(0..4)])
  Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"Mystery"), place: place8, remote_photo_url: remote_photo_url_experience[rand(0..4)])

place9 = Place.create!(name: "Lee's Cafe", street: "Rua Filinto Elisio 21", city: "Lisbon", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"Mystery"), place: place9, remote_photo_url: remote_photo_url_experience[rand(0..4)])
  Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"Mystery"), place: place9, remote_photo_url: remote_photo_url_experience[rand(0..4)])

place10 = Place.create!(name: "Costa de Cafe", street: "Avenida da Liberdade 13", city: "Lisbon", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"Mystery"), place: place10, remote_photo_url: remote_photo_url_experience[rand(0..4)])
  Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"Mystery"), place: place10, remote_photo_url: remote_photo_url_experience[rand(0..4)])



puts 'Done :)'
