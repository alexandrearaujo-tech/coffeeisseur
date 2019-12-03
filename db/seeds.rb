require 'faker'

puts "Deleting all previous attributes..."

Review.destroy_all
Booking.destroy_all
Compliment.destroy_all
Experience.destroy_all
Place.destroy_all
Category.destroy_all
User.destroy_all


puts "Creating Categories"
categories_id = []
category = Category.create!(name: "Workshops", icon: "fas fa-chalkboard-teacher")
categories_id << category.id

category = Category.create!(name: "Tasting", icon: "fas fa-mug-hot")
categories_id << category.id

category = Category.create!(name: "New Beans", icon: "fas fa-bullhorn")
categories_id << category.id

category = Category.create!(name: "Coffee Talks", icon: "fas fa-handshake")
categories_id << category.id

category = Category.create!(name: "Festivals", icon: "fas fa-calendar-alt")
categories_id << category.id

category = Category.create!(name: "Competitions", icon: "fas fa-award")
categories_id << category.id

category = Category.create!(name: "Suprise Me", icon: "fas fa-gift")
categories_id << category.id

# Card.destroy_all
# Interest.destroy_all
# UserExperience.destroy_all
# UserPlace.destroy_all
# UserInterest.destroy_all

remote_photo_url_place = [
  "https://res.cloudinary.com/coffeeisseur/image/upload/q_auto/v1574863463/yhldnrjutaxsyfrdilqi.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/q_auto/v1574863492/ebg0in801mwfpjs0nfml.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/q_auto/v1574863506/ytqc4jghmkfr3azhusfq.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/q_auto/v1574863545/t85lgulwwwxuezljj5rw.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/q_auto/v1574863580/gxidfpmsd82a2gp8hwmj.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/q_auto/v1575376259/fbd92d768814_ifs66q.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/q_auto/v1575376336/1e0d58224f24_cnzyu7.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/q_auto/v1575376403/e8f1f318ba72_nmegqm.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/q_auto/v1575376464/d22f3f1eea14_dqddm6.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/q_auto/v1575376531/c4024d13c247_e6go3a.jpg"
]

remote_photo_url_experience = [
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1575376802/c4b6352145ee_fmfuca.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1575378359/tr-1526_1_nbc5md.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1575378083/480f579e7578_zbzfrm.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1575378036/a838615193b0_whkab8.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1575377918/cdb90b04b2e3_pb12kn.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1575378592/photo-1513270685578-bef8f99b9736_w1ktlf.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1575378663/photo-1497048764944-20ecb62895e1_flm6kc.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1575378691/photo-1414808549009-35951c724e9f_xy3plu.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1575381067/photo-1483204358806-afc5571f655b_dh8bgr.jpg",
  "https://res.cloudinary.com/coffeeisseur/image/upload/v1575376684/aero-e1509557517698_gtkowq.jpg"
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
    name: "Buna Specialty Coffee Shop",
    street: "Avenida Ressano Garcia 43A",
    city: "Lisbon"
  },
  {
    name: "Copenhagen Coffee Lab (& Bakery)",
    street: "Campo de Santa Clara 136",
    city: "Lisbon"
  },
  {
    name: "Amélia",
    street: "Rua Ferreira Borges 101",
    city: "Lisbon"
  },
  {
    name: "Kafeine Coffee & Brunch",
    street: "Avenida da Liberdade 180",
    city: "Lisbon"
  },
  {
    name: "Milkees",
    street: "Rua São Sebastião da Pedreira 51C",
    city: "Lisbon"
  },
  {
    name: "Manifest.Lisbon",
    street: "Rua da Sociedade Farmacêutica 31",
    city: "Lisbon"
  },
  {
    name: "Simpli",
    street: "Rua Braamcamp 64",
    city: "Lisbon"
  },
  {
    name: "Fábrica Coffee Roasters",
    street: "Rua das Portas de Santo Antão 136",
    city: "Lisbon"
  }
]

experiences = [
  {category_id: categories_id[0],name: "Espresso Yourself", description: "Experience coffee as it should be. Hone your barista skills and come away with the knowledge to make stunning coffee, milk microfoam, and beautiful latte art at home."},
  {category_id: categories_id[1],name: "Coffee Culture", description: "Earn the rights to call yourself a real coffee connoisseur on a coffee cupping experience. This coffee 'cupping' session at Ozone will take coffee drinkers on a journey from bean to cup. Coffee 'cupping' is a professional practice for best observing the tastes and aromas of a particular brew and is the internationally recognised standard for tasting and scoring coffees."},
  {category_id: categories_id[0],name: "Unleash Your Inner Barista", description: "If you’re a coffee enthusiast, join this Signature Masterclass and sip on a variety of coffees from all around the world. Learn the basics and find out how to make the perfect brew by an expert barista during this insightful interactive class. This experience is ideal for any coffee lover who wants to learn how to make the perfect cup of Joe."},
  {category_id: categories_id[0],name: "L-ART-E Skills", description: "If you’re a coffee lover, join this Latte Art Workshop to master the perfect heart, tulip and rosetta to go along with your hot beverage. Learn all the tips and tricks to make your latte art up to par with barista standards. An experience to hone in on your latte art skills with demonstrations and practice."},
  {category_id: categories_id[3],name: "True Brew", description: "The beauty of speciality coffee is that it’s usually roasted in small stores or factories, using traditional methods and technology. Whereas commercial coffee tends to be sold ready-ground, speciality coffee appears as whole beans and needs to be ground before it is brewed. Discover the world of speciality coffee, learning how to create the perfect brew."},
  {category_id: categories_id[2],name: "Coffee Country", description: "Take a coffee to go and watch people pass by in leafy Praça das Flores, or explore the high-end shopping and restaurants of Principe Real. The Portuguese parliament building, Assembleia da República, is also close by."},
  {category_id: categories_id[3],name: "Meet Over a Cup", description: "A team of enthusiastic coffee professionals are ready to give recommendations and encourage you to enjoy your drink on the patio."},
  {category_id: categories_id[1],name: "Bean to Cup", description: "After an introductory cup of coffee and roastery tour, we’ll look at green beans and explore how varietals, altitude, and processing methods affect the coffee flavour profile. Next, you will roast a sample batch and discover how we create different profiles for the perfect espresso or filter roast. Then it’s time to “cup” the coffees side-by-side with an aroma kit to help you identify unique flavours and find their coffee taste preference."},
  {category_id: categories_id[4],name: "CoffeeFest", description: "Celebrate the coffee culture and gather in the same place everyone who like, work with or want to learn more about this intensely flavoured and strongly scented drink."},
  {category_id: categories_id[5],name: "AeroPress Championship", description: "The annual AeroPress Championship for coffee enthusiasts and professionals who gather to compete for the best AeroPress recipe. The winner gets a trip to the World Finals to represent Portugal."}
]


puts "Creating Users"
users_id = []

user_one = User.create!(
  first_name: 'Sharon',
  last_name: 'Moriel',
  email: 'sharon@gmail.com',
  password: '123456')
  users_id << user_one.id


user_two = User.create!(
  first_name: 'Andre',
  last_name: 'Pires',
  email: 'andre@gmail.com',
  password: '123456')
  users_id << user_two.id


puts "Creating Places and Experiences"

experiences_id = []
i = 0
10.times do
  place = Place.create!(
    name: places[i][:name],
    street: places[i][:street],
    average_rating: rand(1..5),
    city: places[i][:city],
    remote_photo_url: remote_photo_url_place[i]
  )
  experience = Experience.create!(
    name: experiences[i][:name],
    description: experiences[i][:description],
    category_id: experiences[i][:category_id],
    average_rating: rand(1..5),
    remote_photo_url: remote_photo_url_experience[i],
    place: place
  )
  experiences_id << experience.id
  i += 1
end


puts "Creating Compliment"

Compliment.create!(name: "Food")
Compliment.create!(name: "Space")
Compliment.create!(name: "Coffee")
Compliment.create!(name: "Staff")
Compliment.create!(name: "Customers")


puts "Creating Bookings & Reviews"
bookings_id = []
i = 0
10.times do
  booking = Booking.create!(
    date: DateTime.new,
    user_id: users_id[rand(0..1)],
    experience: Experience.find(experiences_id[i])
  )
  4.times do
    Review.create!(
      content: reviews_content[rand(0..4)],
      rating: rand(1..5),
      booking_id: booking.id,
      compliment: Compliment.all.sample
    )
  end
  i += 1
end

puts 'Done :)'






# Old Seeds


# users_id = []
# 5.times do
#   user = User.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.free_email,
#     password: '123456')
#   users_id << user.id
# end



# experiencies = [
#   {name: "LisBOA ROA-sting!", description: "Take a coffee to go and watch people pass by in leafy Praça das Flores, or explore the high-end shopping and restaurants of Principe Real. The Portuguese parliament building, Assembleia da República, is also close by."},
#   {name: "Coffee Country", description: "A team of enthusiastic coffee professionals are ready to give recommendations and encourage you to enjoy your drink on the patio."},
#   {name: "Meet Over a Cup", description: "A team of enthusiastic coffee professionals are ready to give recommendations and encourage you to enjoy your drink on the patio."},
#   {name: "Taste of Finca", description: "Take a coffee to go and watch people pass by in leafy Praça das Flores, or explore the high-end shopping and restaurants of Principe Real. The Portuguese parliament building, Assembleia da República, is also close by."},
#   {name: "Group Drink Meetup", description: "A team of enthusiastic coffee professionals are ready to give recommendations and encourage you to enjoy your drink on the patio."},
#   {name: "Nao Caoffe", description: "Take a coffee to go and watch people pass by in leafy Praça das Flores, or explore the high-end shopping and restaurants of Principe Real. The Portuguese parliament building, Assembleia da República, is also close by."},
#   {name: "Ethiopia Tasting", description: "A team of enthusiastic coffee professionals are ready to give recommendations and encourage you to enjoy your drink on the patio."},
#   {name: "Bean Me Up!", description: "Take a coffee to go and watch people pass by in leafy Praça das Flores, or explore the high-end shopping and restaurants of Principe Real. The Portuguese parliament building, Assembleia da República, is also close by."},
#   {name: "Naked Coffee!", description: "A team of enthusiastic coffee professionals are ready to give recommendations and encourage you to enjoy your drink on the patio."},
#   {name: "Now THIS is coffee", description: "Take a coffee to go and watch people pass by in leafy Praça das Flores, or explore the high-end shopping and restaurants of Principe Real. The Portuguese parliament building, Assembleia da República, is also close by."},
# ]


# places_id = []
# 10.times do
#   place = Place.create!(
#     name: places[rand(0..9)][:name],
#     street: places[rand(0..9)][:street],
#     average_rating: rand(1..5),
#     city: places[rand(0..9)][:city],
#     remote_photo_url: remote_photo_url_place[rand(0..4)]
#   )
#   experience = Experience.create!(
#     name: experiencies[rand(0..9)][:name],
#     category_id: categories_id[rand(0..6)],
#     description: experiencies[rand(0..9)][:description],
#     average_rating: rand(1..5),
#     remote_photo_url: remote_photo_url_experience[rand(0..4)],
#     place: place
#   )
#   places_id << place.id
# end

# puts "Creating Review"
# 10.times do
#   Review.create!(
#     content: reviews_content[rand(0..4)],
#     rating: rand(1..5),
#     booking_id: bookings_id.sample,
#     compliment: Compliment.all.sample
#   )
# end


















