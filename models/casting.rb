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

  def save()
    sql = "INSERT INTO castings (
    star_id, movie_id, fee
    ) Values (
      $1, $2, $3
      ) RETURNING id"
    values = [@star_id, @movie_id, @fee]
    castings = SqlRunner.run(sql, values).first()
    @id = castings['id'].to_i()
  end

  def update()
    sql = "UPDATE castings SET
    fee = $1
    WHERE id = $2"
    values = [@fee, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM castings"
    castings = SqlRunner.run(sql)
    result = castings.map{|casting| Casting.new(casting)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end



end
