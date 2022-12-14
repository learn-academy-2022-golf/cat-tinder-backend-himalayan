# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
pigs = [
  {
    name: 'Felix',
    breed: 'Peruvian Guinea Pig',
    habits: 'Long study sessions, and a warm fire.',
    image: 'https://unsplash.com/photos/0EhFkzIinlk'
  },
  {
    name: 'Homer',
    breed: 'American Crested',
    habits: 'Scared since his human left.',
    image: 'https://unsplash.com/photos/3fjyk4CLfvA'
  },
  {
    name: 'Jack',
    breed: 'Skinny Pig',
    habits: 'Furrrrociously eating carrots, can be aggressive without food',
    image: 'https://unsplash.com/photos/MUcxe_wDurE'
  }
]

pigs.each do |each_pig|
  Pig.create each_pig
  puts "creating pig #{each_pig}"
end