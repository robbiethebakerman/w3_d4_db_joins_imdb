require_relative("../db/sql_runner.rb")
require_relative("star")

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO movies (title, genre)
      VALUES ($1, $2)
      RETURNING *;"
    values = [@title, @genre]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.find(id)
    sql = "SELECT *
      FROM movies
      WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    movie = Movie.new(result)
    return movie
  end

  def update()
    sql = "UPDATE movies
      SET (title, genre) = ($1, $2)
      WHERE id = $3;"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM movies
      WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT *
      FROM movies;"
    results = SqlRunner.run(sql)
    movies = results.map { |result| Movie.new(result) }
    return movies
  end

  def self.delete_all()
    sql = "DELETE FROM movies;"
    SqlRunner.run(sql)
  end

  def stars()
    sql = "SELECT stars.*
      FROM stars
      INNER JOIN castings
      ON stars.id = castings.star_id
      WHERE movie_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    stars = results.map { |result| Star.new(result) }
    return stars
  end

end
