require_relative('../db/sql_runner.rb')

class Deal

  attr_reader(:id, :name, :day, :discount, :eatery_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @day = options['day']
    @discount = options['discount'].to_i
    @eatery_id = options['eatery_id']
  end

  def save()
    sql = "INSERT INTO deals (name, day, discount, eatery_id) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @day, @discount, @eatery_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end


end
