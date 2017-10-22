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


end
