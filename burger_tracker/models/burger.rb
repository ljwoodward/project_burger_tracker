require_relative('../db/sql_runner.rb')
require_relative('deal.rb')
require_relative('eatery.rb')

class Burger

  attr_reader(:id, :eatery_id)
  attr_accessor(:name, :price)

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

  def update()
    sql = "UPDATE burgers SET (name, price, eatery_id) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @price, @eatery_id, @id]
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

  def deals()
    sql = "SELECT deals.*
    FROM deals
    INNER JOIN burgers_deals
    ON burgers_deals.deal_id = deals.id
    WHERE burger_id = $1"
    values = [@id]
   	deals = SqlRunner.run(sql, values)
  	result = deals.map { |deal| Deal.new( deal ) }
  	return result
  end

  def discount(deal)
    percent = (deal.discount/100.00).to_f
    discount = @price * percent
    discount_price = @price - discount
    return discount_price.round(2)
  end


end
