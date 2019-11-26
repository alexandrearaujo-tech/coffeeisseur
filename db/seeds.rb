# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([ name: 'Star Wars' ,  name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creating Users, Places, Experiences...'

User.destroy_all
Place.destroy_all


5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: '123456')
  end

  Place.create!(name: "Benjamin Coffee House", street: "Rua do Possolo 52", city: "Lisbon", photo: "", average_rating: "")
  Place.create!(name: "COMOBA", street: "Rua de S. Paulo 99", city: "Lisbon", photo: "", average_rating: "")
  Place.create!(name: "Cafe de Finca", street: "Rua Luís de Camões 112 A", city: "Lisbon", photo: "", average_rating: "")
  Place.create!(name: "Copenhagen Coffee Lab (& Bakery)", street: "Campo de Santa Clara 136", city: "Lisbon", photo: "", average_rating: "")
  Place.create!(name: "Lovers Coffee", street: "Rua Nova da Piedade 10", city: "Lisbon", photo: "", average_rating: "")
  Place.create!(name: "Cafe Fantasia", street: "Escolas Gerais 34", city: "Lisbon", photo: "", average_rating: "")
  Place.create!(name: "Coffee Best", street: "Rua Prior do Crato 1A", city: "Lisbon", photo: "", average_rating: "")
  Place.create!(name: "Cafe Enamorado", street: "Escolas Gerais 34", city: "Lisbon", photo: "", average_rating: "")
  Place.create!(name: "Lee's Cafe", street: "Rua Filinto Elisio 21", city: "Lisbon", photo: "", average_rating: "")
  Place.create!(name: "Costa de Cafe", street: "Avenida da Liberdade 13", city: "Lisbon", photo: "", average_rating: "")

puts 'Done :)'
