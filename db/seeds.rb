# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([ name: 'Star Wars' ,  name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Deleting previous all previous attributes..."

Review.destroy_all
Booking.destroy_all
Category.destroy_all
Compliment.destroy_all
Experience.destroy_all
Place.destroy_all
User.destroy_all

# Card.destroy_all
# Interest.destroy_all
# UserExperience.destroy_all
# UserPlace.destroy_all
# UserInterest.destroy_all

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

reviews_content = [
  "Great place for someone who doesnt bother to show off. Its purely “Copenhagen” style, with fresh baked food, flavored dishes and excellent coffee. We are in Lisbon already three days and this is our third time visiting the place. Good coffee to take away as well. Friendly staff and thanks god they do speak English.",
  "Nice ambience. Chocolate bun is not so good. Is better to try the cardamomo bread option. Quiet place to work or just to enjoy a Coffee",
  "Decor was hip. First three coffees we tried to order from their menu they said they didn't have (V60, Aeropress, & cold brew) . Didn't have cream either. Only milk. Service was a little slow, but friendly. Food was OK. I got the avocado …",
  "Very good Cappuccino, the best! We came twice to have breakfast, they have good toast with cheese and avocado. Good and fast service. Very nice and simple place.",
  "I absolutely loved the Mill! I went see several times during my visit to Lisboa. Staff is extremely friendly and helpful. Knowledgeable about the food and coffee. Staff is relaxed and look like they enjoy their jobs vs being stressed out. …"
]

places = [
  {
    name: "Benjamin Coffee House",
    street: "Rua do Possolo 52",
    city: "Lisbon"
  },
  {
    name: "Comoba",
    street: "Rua de S. Paulo 99",
    city: "Lisbon"
  },
  {
    name: "Cafe de Finca",
    street: "Rua Luís de Camões 112 A",
    city: "Lisbon"
  },
  {
    name: "Copenhagen Coffee Lab (& Bakery)",
    street: "Campo de Santa Clara 136",
    city: "Lisbon"
  },
  {
    name: "Lovers Coffee",
    street: "Rua Nova da Piedade 10",
    city: "Lisbon"
  },
  {
    name: "Cafe Fantasia",
    street: "Escolas Gerais 34E",
    city: "Lisbon"
  },
  {
    name: "Coffee Best",
    street: "Rua Prior do Crato 1A",
    city: "Lisbon"
  },
  {
    name: "Cafe Enamorado",
    street: "Escolas Gerais 34",
    city: "Lisbon"
  },
  {
    name: "Lee's Cafe",
    street: "Rua Filinto Elisio 21",
    city: "Lisbon"
  },
  {
    name: "Costa de Cafe",
    street: "Avenida da Liberdade 13",
    city: "Lisbon"
  }
]

experiencies = [
  {name: "LisBOA ROA-sting!", description: "Take a coffee to go and watch people pass by in leafy Praça das Flores, or explore the high-end shopping and restaurants of Principe Real. The Portuguese parliament building, Assembleia da República, is also close by."},
  {name: "Coffee Country", description: "A team of enthusiastic coffee professionals are ready to give recommendations and encourage you to enjoy your drink on the patio."},
  {name: "Meet Over a Cup", description: "A team of enthusiastic coffee professionals are ready to give recommendations and encourage you to enjoy your drink on the patio."},
  {name: "Taste of Finca", description: "Take a coffee to go and watch people pass by in leafy Praça das Flores, or explore the high-end shopping and restaurants of Principe Real. The Portuguese parliament building, Assembleia da República, is also close by."},
  {name: "Group Drink Meetup", description: "A team of enthusiastic coffee professionals are ready to give recommendations and encourage you to enjoy your drink on the patio."},
  {name: "Nao Caoffe", description: "Take a coffee to go and watch people pass by in leafy Praça das Flores, or explore the high-end shopping and restaurants of Principe Real. The Portuguese parliament building, Assembleia da República, is also close by."},
  {name: "Ethiopia Tasting", description: "A team of enthusiastic coffee professionals are ready to give recommendations and encourage you to enjoy your drink on the patio."},
  {name: "Bean Me Up!", description: "Take a coffee to go and watch people pass by in leafy Praça das Flores, or explore the high-end shopping and restaurants of Principe Real. The Portuguese parliament building, Assembleia da República, is also close by."},
  {name: "Naked Coffee!", description: "A team of enthusiastic coffee professionals are ready to give recommendations and encourage you to enjoy your drink on the patio."},
  {name: "Now THIS is coffee", description: "Take a coffee to go and watch people pass by in leafy Praça das Flores, or explore the high-end shopping and restaurants of Principe Real. The Portuguese parliament building, Assembleia da República, is also close by."},
]


puts "Creating Users"
users_id = []
5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: '123456')
  users_id << user.id
end

puts "Creating Places"
places_id = []
20.times do
  place = Place.create!(
    name: places[rand(0..9)][:name],
    street: places[rand(0..9)][:street],
    city: places[rand(0..9)][:city],
    remote_photo_url: remote_photo_url_place[rand(0..4)]
  )
  places_id << place.id
end

puts "Creating Categories"
categories_id = []
category = Category.create!(name: "Workshops", icon: "fas fa-chalkboard-teacher")
categories_id << category.id

category = Category.create!(name: "Competitions", icon: "fas fa-award")
categories_id << category.id

category = Category.create!(name: "Tasting", icon: "fas fa-mug-hot")
categories_id << category.id

category = Category.create!(name: "New Beans", icon: "fas fa-bullhorn")
categories_id << category.id

category = Category.create!(name: "Coffee Talks", icon: "fas fa-handshake")
categories_id << category.id

category = Category.create!(name: "Festivals", icon: "fas fa-calendar-alt")
categories_id << category.id

category = Category.create!(name: "Mystery", icon: "fas fa-gift")
categories_id << category.id

puts "Creating Compliment"
Compliment.create!(name: "Food")
Compliment.create!(name: "Space")
Compliment.create!(name: "Coffee")
Compliment.create!(name: "Staff")
Compliment.create!(name: "Customers")

puts "Creating Experiencies"
experiencies_id = []
20.times do
  experience = Experience.create!(
    name: experiencies[rand(0..9)][:name],
    category_id: categories_id[rand(0..6)],
    description: experiencies[rand(0..9)][:description],
    average_rating: rand(1.0..5.0),
    remote_photo_url: remote_photo_url_experience[rand(0..4)],
    place_id: places_id[rand(0..19)]
  )
  experiencies_id << experience.id
end

puts "Create Booking"
bookings_id = []
40.times do
  booking = Booking.create!(
    date: DateTime.new,
    user_id: users_id[rand(0..4)],
    experience_id: experiencies_id[rand(0..19)],
  )
  bookings_id << booking.id
end

puts "Creating Review"
200.times do
  Review.create!(
    content: reviews_content[rand(0..4)],
    rating: rand(1..5),
    booking_id: bookings_id[rand(0..39)],
    compliment: Compliment.all.sample
  )
end

puts 'Done :)'


























