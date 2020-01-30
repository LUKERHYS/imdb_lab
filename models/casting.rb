class Casting
require_relative("../db/sql_runner")

attr_reader :id, :star_id, :movie_id
attr_accessor :fee

  def initialize(options)
    @id = options["id"]
    @star_id = options["star_id"]
    @movie_id = options["movie_id"]
    @fee = options["fee"]
  end

end
