require_relative('../db/sql_runner.rb')

class BurgerDeal

  attr_reader(:id, :eatery_id, :burger_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @eatery_id = options['eatery_id'].to_i
    @burger_id = options['burger_id'].to_i
  end

  def save()
    sql = "INSERT INTO burgerdeals (eatery_id, burger_id) VALUES ($1, $2) RETURNING id"
    values = [@eatery_id, @burger_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM burgerdeals"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.find(id)
    sql = "SELECT * FROM burgerdeals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return BurgerDeal.new(result.first)
  end


end
