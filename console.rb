require_relative("models/casting")
require_relative("models/movie")
require_relative("models/star")
require("pry")

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

star1 = Star.new({'first_name' => 'Michael',
  'last_name' => 'Douglas' })
  star1.save()
star2 = Star.new({'first_name' => 'Michael',
  'last_name' => 'Kane' })
  star2.save()

movie1 = Movie.new({'title' => 'Falling down', 'genre' => 'Drama/Crime', 'budget' => 35000})
  movie1.save()
movie2 = Movie.new({'title' => 'Falling up', 'genre' => 'Drama/Crime', 'budget' => 3500000})
  movie2.save()

casting1 = Casting.new({'star_id' => star1.id,
  'movie_id' => movie1.id, 'fee' => 2000})
    casting1.save()
casting2 = Casting.new({'star_id' => star1.id,
  'movie_id' => movie2.id, 'fee' => 4123})
    casting2.save()
casting3 = Casting.new({'star_id' => star1.id,
  'movie_id' => movie2.id, 'fee' => 1234})
  casting3.save()


binding.pry
nil
