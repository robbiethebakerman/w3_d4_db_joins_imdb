require_relative("../db/sql_runner.rb")

class Star

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO stars (first_name, last_name)
      VALUES ($1, $2)
      RETURNING *;"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.find()
    sql = "SELECT *
      FROM stars
      WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    star = Star.new(result)
    return star
  end

  def update()
    sql = "UPDATE stars
      SET (first_name, last_name) = ($1, $2)
      WHERE id = $3;"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM stars
      WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT *
      FROM stars;"
    results = SqlRunner.run(sql)
    movies = results.map { |result| Star.new(result) }
    return movies
  end

  def self.delete_all()
    sql = "DELETE FROM stars;"
    SqlRunner.run(sql)
  end

  def movies()
    sql = "SELECT movies.*
      FROM movies
      INNER JOIN castings
      ON movies.id = castings.movie_id
      WHERE star_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    movies = results.map { |result| Movie.new(result) }
    return movies
  end

end
