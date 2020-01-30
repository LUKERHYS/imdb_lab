require_relative("models/casting")
require_relative("models/movie")
require_relative("models/star")

require("pry")

star1 = Star.new({'first_name' => 'Michael',
  'last_name' => 'Douglas' })
  star1.save()
star2 = Star.new({'first_name' => 'Michael',
  'last_name' => 'Kane' })
  star2.save()

movie1 = Movie.new({'title' => 'Falling down', 'genre' => 'Drama/Crime'})
  movie1.save()
movie2 = Movie.new({'title' => 'Falling up', 'genre' => 'Drama/Crime'})
  movie2.save()

casting1 = Casting.new({'star_id' => star1.id,
  'movie_id' => movie1.id, 'fee' => 2000})
  casting1.save()


binding.pry
nil
