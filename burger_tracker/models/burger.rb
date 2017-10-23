require_relative('../db/sql_runner.rb')

class Burger

  attr_reader(:id, :name, :price, :eatery_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @price = options['price'].to_f
    @eatery_id = options['eatery_id'].to_i
  end

  def save()
    sql = "INSERT INTO burgers (name, price, eatery_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @price, @eatery_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM burgers"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.find(id)
    sql = "SELECT * FROM burgers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Burger.new(result.first)
  end

  def self.all()
    sql = "SELECT * FROM burgers"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |burger| Burger.new( burger ) }
  end


end
