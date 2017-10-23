require_relative('../db/sql_runner.rb')

class Deal

  attr_reader(:id, :eatery_id)
  attr_accessor(:name, :day, :discount)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @day = options['day']
    @discount = options['discount'].to_i
    @eatery_id = options['eatery_id'].to_i
  end

  def save()
    sql = "INSERT INTO deals (name, day, discount, eatery_id) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @day, @discount, @eatery_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM deals"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.find(id)
    sql = "SELECT * FROM deals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Deal.new(result.first)
  end

  def self.all()
    sql = "SELECT * FROM deals"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |deal| Deal.new( deal ) }
  end

  def update()
    sql = "UPDATE deals SET (name, day, discount, eatery_id) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @day, @discount, @eatery_id, @id]
    SqlRunner.run(sql, values)
  end

  def eatery()
    sql = "SELECT * FROM eateries WHERE id = $1"
    values = [@eatery_id]
    results = SqlRunner.run(sql, values)
    eatery_data = results[0]
    eatery = Eatery.new(eatery_data)
    return eatery
  end

  def burgers()
    sql = "SELECT burgers.*
    FROM burgers
    INNER JOIN burgers_deals
    ON burgers_deals.burger_id = burgers.id
    WHERE deal_id = $1"
    values = [@id]
    burgers = SqlRunner.run(sql, values)
    result = burgers.map { |burger| Burger.new( burger ) }
    return result
  end



end
