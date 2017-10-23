require_relative('../db/sql_runner.rb')

class BurgerDeal

  attr_reader(:id, :deal_id, :burger_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @deal_id = options['deal_id'].to_i
    @burger_id = options['burger_id'].to_i
  end

  def save()
    sql = "INSERT INTO burgers_deals (deal_id, burger_id) VALUES ($1, $2) RETURNING id"
    values = [@deal_id, @burger_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM burgers_deals"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.find(id)
    sql = "SELECT * FROM burgers_deals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return BurgerDeal.new(result.first)
  end

  def self.all()
    sql = "SELECT * FROM burgers_deals"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |burgerdeal| BurgerDeal.new( burgerdeal ) }
  end


end
