require "json"
require "open-uri"

movies = JSON.parse(File.open(File.join(__dir__, "seeds/top250.json")).read)
50.times do |n|
  movie = movies["items"][n]
  url ="https://imdb-api.com/en/API/Title/k_5xzavmo7/#{movie["id"]}"

  File.open(File.join(__dir__, "seeds/#{movie["id"]}.json"), "wb") do |file|
    file.write URI.open(url).read
  end
end
