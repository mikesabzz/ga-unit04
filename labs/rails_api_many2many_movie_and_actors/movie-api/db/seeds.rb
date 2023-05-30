# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
movie1 = Movie.create(title: "Silver Linings Playbook")
movie2 = Movie.create(title: "Guardians of the Galaxy")
movie3 = Movie.create(title: "Sully")
movie4 = Movie.create(title: "Toy Story")

puts "#{Movie.count} movies created!"

actor1 = Actor.create(name: "Bradley Cooper")
actor2 = Actor.create(name: "Tom Hanks")


puts "#{Actor.count} actors created!"

actor1.movies.push(movie1, movie2)
actor2.movies.push(movie3, movie4)
