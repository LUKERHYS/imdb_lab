require_relative("models/casting")
require_relative("models/movie")
require_relative("models/star")

require("pry")

star1 = Star.new({'first_name' => 'Michael',
  'last_name' => 'Douglas' })

movie1 = Movie.new({'title' => 'Falling down', 'genre' => 'Drama/Crime'})

casting1 = Casting.new({'star_id' => star1.id,
  'movie_id' => movie1.id, 'fee' => 2000})



binding.pry
nil
