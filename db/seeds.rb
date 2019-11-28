# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([ name: 'Star Wars' ,  name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Deleting previous all previous attributes..."

User.destroy_all
Booking.destroy_all
Review.destroy_all
Experience.destroy_all
Place.destroy_all
Category.destroy_all
Card.destroy_all

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

puts "Creating Users"

5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: '123456')
end

# Creating Categories
puts "Creating Categories"


Category.create!(name: "Workshops", icon: "fas fa-chalkboard-teacher")
Category.create!(name: "Competitions", icon: "fas fa-award")
Category.create!(name: "Tasting", icon: "fas fa-mug-hot")
Category.create!(name: "New Beans", icon: "fas fa-bullhorn")
Category.create!(name: "Coffee Talks", icon: "fas fa-handshake")
Category.create!(name: "Festivals", icon: "fas fa-calendar-alt")
Category.create!(name: "Mystery", icon: "fas fa-gift")

  # Category.create!(name: "roasting")
  # Category.create!(name: "meetup")
puts "Creating Compliment"

Compliment.create!(name: "Food")
Compliment.create!(name: "Space")
Compliment.create!(name: "Coffee")
Compliment.create!(name: "Staff")

puts "Creating Places & Experiences"

#create Places with real addressess
place1 = Place.create!(name: "Benjamin Coffee House",street: "Rua do Possolo 52", city: "Lisbon", photo: "", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
experience1 = Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"Mystery"), description: 'A Special Description!', remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place1)
experience2 = Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"Mystery"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place1)
booking1 = Booking.create!(date: Time.now.to_datetime, user: User.first, experience: experience1)
booking2 = Booking.create!(date: Time.now.to_datetime, user: User.last, experience: experience2)

puts "Creating Review"

10.times do
  Review.create!(content: "this is an amazing coffee", rating: rand(1..5), booking: Booking.all.sample, compliment: Compliment.all.sample)
end


place2 = Place.create!(name: "COMOBA", street: "Rua de S. Paulo 99", city: "Lisbon", photo: "", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "LisBOA ROA-sting!", category: Category.find_by(name:"Mystery"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place2)
  Experience.create!(name: "Coffee Country", category: Category.find_by(name:"Festivals"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place2)

place3 = Place.create!(name: "Cafe de Finca", street: "Rua Luís de Camões 112 A", city: "Lisbon", photo: "", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Meet Over a Cup", category: Category.find_by(name:"Tasting"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place3)
  Experience.create!(name: "Taste of Finca", category: Category.find_by(name:"Mystery"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place3)

place4 = Place.create!(name: "Copenhagen Coffee Lab (& Bakery)", street: "Campo de Santa Clara 136", city: "Lisbon", photo: "", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Group Drink Meetup", category: Category.find_by(name:"Tasting"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place4)
  Experience.create!(name: "Nao Caoffe", category: Category.find_by(name:"Mystery"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place4)

place5 = Place.create!(name: "Lovers Coffee", street: "Rua Nova da Piedade 10", city: "Lisbon", photo: "", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Now THIS is coffee", category: Category.find_by(name:"Competitions"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place5)
  Experience.create!(name: "Coffee Lovers Group", category: Category.find_by(name:"Mystery"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place5)

place6 = Place.create!(name: "Cafe Fantasia", street: "Escolas Gerais 34E", city: "Lisbon", photo: "", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Mystic Beans", category: Category.find_by(name:"Workshops"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place6)
  Experience.create!(name: "Ethiopia Tasting", category: Category.find_by(name:"Mystery"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place6)

place7 = Place.create!(name: "Coffee Best", street: "Rua Prior do Crato 1A", city: "Lisbon", photo: "", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Coffee on the Moon!", category: Category.find_by(name:"Mystery"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place7)
  Experience.create!(name: "Bean Me Up!", category: Category.find_by(name:"Tasting"), remote_photo_url: remote_photo_url_experience[rand(0..4)], description: "A Special Description!", place: place7)

place8 = Place.create!(name: "Cafe Enamorado", street: "Escolas Gerais 34", city: "Lisbon", photo: "", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"Workshops"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place8)
  Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"Mystery"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place8)

place9 = Place.create!(name: "Lee's Cafe", street: "Rua Filinto Elisio 21", city: "Lisbon", photo: "", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"Competitions"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place9)
  Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"Mystery"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place9)

place10 = Place.create!(name: "Costa de Cafe", street: "Avenida da Liberdade 13", city: "Lisbon", photo: "", remote_photo_url: remote_photo_url_place[rand(0..4)], average_rating: "")
  Experience.create!(name: "Roasting with the Masters", category: Category.find_by(name:"Mystery"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place10)
  Experience.create!(name: "Naked Coffee!", category: Category.find_by(name:"Festivals"), description: "A Special Description!", remote_photo_url: remote_photo_url_experience[rand(0..4)], place: place10)

puts 'Done :)'
