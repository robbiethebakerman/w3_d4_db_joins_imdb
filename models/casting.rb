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
    sql = ""
    values = []
    result = SqlRunner.run(sql, values)
  end

  def self.find()
    sql = ""
    values = []
    results = SqlRunner.run(sql, values)
  end

  def update()
    sql = ""
    values = []
    results = SqlRunner.run(sql, values)
  end

  def delete()
    sql = ""
    values = []
    results = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = ""
    values = []
    results = SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = ""
    values = []
    results = SqlRunner.run(sql, values)
  end

end
