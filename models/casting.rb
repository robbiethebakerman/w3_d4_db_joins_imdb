require_relative("../db/sql_runner.rb")

class Casting

  attr_reader :id
  attr_accessor :movie_id, :star_id, :fee

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @fee = options['fee']
  end

  def save()
    sql = "INSERT INTO castings (movie_id, star_id, fee)
      VALUES ($1, $2, $3)
      RETURNING *;"
    values = [@movie_id, @star_id, @fee]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.find()
    sql = "SELECT *
      FROM castings
      WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    casting = Casting.new(result)
    return casting
  end

  def update()
    sql = "UPDATE castings
      SET (movie_id, star_id, fee) = ($1, $2, $3)
      WHERE id = $4;"
    values = [@movie_id, @star_id, @fee, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM castings
      WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT *
      FROM castings;"
    results = SqlRunner.run(sql)
    castings = results.map { |result| Casting.new(result) }
    return castings
  end

  def self.delete_all()
    sql = "DELETE FROM castings;"
    SqlRunner.run(sql)
  end

end
