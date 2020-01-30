class Star
  require_relative("../db/sql_runner")

  attr_reader :id
  attr_accessor :first_name, :last_name

    def initialize(options)
      @id = options["id"].to_i() if options["id"]
      @first_name = options["first_name"]
      @last_name = options["last_name"]
    end


    def save()
      sql = "INSERT INTO stars (
      first_name, last_name, fee
      ) Values (
        $1,$2,$3
        ) RETURNING id"
      values = [@first_name, @last_name, @fee]
      stars = SqlRunner.run(sql, values).first()
      @id = stars['id'].to_i()
    end

    def update()
      sql = "UPDATE stars SET(
      first_name, last_name, fee)=( $1, $2, $3 )
      WHERE id = $4"
      values = [@first_name, @last_name, @fee, @id]
      SqlRunner.run(sql, values)
    end

    def movies()
      sql = "SELECT movies.* FROM movies
      INNER JOIN castings
      ON movies.id = castings.movie_id
      WHERE star_id = $1"
      values = [@id]
      movies = SqlRunner.run(sql, values)
      results = movies.map{|movie| Movie.new(movie)}
      return results
    end

    def self.all()
      sql = "SELECT * FROM stars"
      stars = SqlRunner.run(sql)
      result = stars.map{|star| Star.new(star)}
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM stars"
      SqlRunner.run(sql)
    end
end
