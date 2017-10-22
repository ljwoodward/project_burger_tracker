require_relative('../db/sql_runner.rb')

class Visit

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

  
end
