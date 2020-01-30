class Movie
  require_relative("../db/sql_runner")

  attr_reader :id
  attr_accessor :title, :genre

    def initialize(options)
      @id = options["id"]
      @title = options["title"]
      @genre = options["genre"]
    end

end
