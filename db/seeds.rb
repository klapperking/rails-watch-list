require "open-uri"
require "json"
require "pry-byebug"
require "faker"

puts "Removing all movies"
Movie.destroy_all

puts "Removing all lists and Bookmarks"
List.destroy_all

puts "Removing all reviews"
Review.destroy_all

puts "Creating Movies"
new_req_flag = false

if new_req_flag
  token_path = __dir__ + "/__moviedb_token.json"

  api_token = JSON.parse(File.read(token_path))["token"]

  whatever = URI.open("https://api.themoviedb.org/3/movie/top_rated",
    'Authorization' => "Bearer #{api_token}",
    'accept' => 'application/json'
  ).read

  response = JSON.parse(whatever)

  File.open("api_answer.json", "w") do |f|
    f.write(JSON.pretty_generate(whatever))
  end

else
  read_path = __dir__ + "/api_answer.json"
  response = JSON.parse(File.read(read_path))
end

response["results"].each do |movie|
  args = {
    title: movie["title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["backdrop_path"]}"
  }
  Movie.create(args)
end

puts "Created #{Movie.count} movies"

puts "Generating Movie lists"
6.times do
  List.create(name: Faker::Company.name)
end

puts "Generated #{List.count} lists"

puts "Generating bookmarks"
(Movie.count * 3 ).times do

  Bookmark.create(
    comment: Faker::Restaurant.review,
    movie: Movie.all.sample,
    list: List.all.sample
  )

end
puts "Generated #{Bookmark.count} bookmarks"
