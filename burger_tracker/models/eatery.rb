require_relative('../db/sql_runner.rb')

class Eatery

  attr_reader(:id)
  attr_accessor(:name, :url)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO eateries (name, url) VALUES ($1, $2) RETURNING id"
    values = [@name, @url]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM eateries"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.find(id)
    sql = "SELECT * FROM eateries WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Eatery.new(result.first)
  end

  def self.all()
    sql = "SELECT * FROM eateries"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |eatery| Eatery.new( eatery ) }
  end

  def update()
    sql = "UPDATE eateries SET (name, url) = ($1, $2) WHERE id = $3"
    values = [@name, @url, @id]
    SqlRunner.run(sql, values)
  end


end
