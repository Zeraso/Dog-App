# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.new(email: "test@gmail.com", encrypted_password: "AZERTY", last_name: "Uber", first_name: "Blanquette de Veau", address: "16 villa Gaudelet Paris")
# Dog.new(name: "Bobby", gender: "Male", breed: "pussy", coat: "Pink")

require 'faker'

puts "Destroying all my dogs"
Dog.destroy_all


puts 'Creating 20 doggies...'
20.times do
  dog = Dog.new(
    name: Faker::Creature::Dog.name,
    breed:Faker::Creature::Dog.breed,
    birthday: "2018""12""12",
    gender: ["Female","Male"].sample,
    coat:Faker::Creature::Dog.coat_length,
    user: User.first
  )
  dog.save!
end
puts 'Finished!'
