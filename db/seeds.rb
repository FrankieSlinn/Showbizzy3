# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Review.create(show_id: 1, rating: 4, review: "Great show!")
Review.create(show_id: 2, rating: 5, review: "Amazing performance!")
Review.create(show_id: 1, rating: 3, review: "Decent show.")
