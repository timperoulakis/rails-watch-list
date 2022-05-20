# frozen_string_literal: true

require "json"
require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

movies = JSON.parse(File.open(File.join(__dir__, "seeds/top250.json")).read)
50.times do |n|
  movie = movies["items"][n]

  details = JSON.parse(File.open(File.join(__dir__, "seeds/#{movie["id"]}.json")).read)
  Movie.create(
    title: movie["title"],
    overview: details["plot"],
    poster_url: details["image"],
    rating: details["imDbRating"].to_f,
    rating_votes: details["imDbRatingVotes"].to_i,
    rating_metacritic: details["metacriticRating"].to_i
  )
end
