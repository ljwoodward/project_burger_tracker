require_relative('../db/sql_runner.rb')

class Visit

  attr_reader(:id, :user_id, :eatery_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_id = options['user_id'].to_i
    @eatery_id = options['eatery_id'].to_i
  end

  def save()
    sql = "INSERT INTO visits (user_id, eatery_id) VALUES ($1, $2) RETURNING id"
    values = [@user_id, @eatery_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM visits"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.find(id)
    sql = "SELECT * FROM visits WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Visit.new(result.first)
  end


end
