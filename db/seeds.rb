require 'faker'

puts "Destroying all my meetings"
Meeting.destroy_all
puts "Destroying all my users"
User.destroy_all
puts "Destroying all my dogs"
Dog.destroy_all

User.create!(email: "k@hotmail.com", password: "AZERTY", last_name: "Uber", first_name: "Blanquette de Veau", address: "16 villa Gaudelet Paris")

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
