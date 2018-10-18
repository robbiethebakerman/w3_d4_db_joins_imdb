class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = ""
    values = []
    result = SqlRunner.run(sql, values)
  end

  def self.find()
    sql = ""
    values = []
    result = SqlRunner.run(sql, values)
  end

  def update()
    sql = ""
    values = []
    result = SqlRunner.run(sql, values)
  end

  def delete()
    sql = ""
    values = []
    result = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = ""
    values = []
    result = SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = ""
    values = []
    result = SqlRunner.run(sql, values)
  end

end
