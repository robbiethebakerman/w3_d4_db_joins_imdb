class Star

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
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
