require_relative('../db/sql_runner.rb')

class User

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO users (name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM users"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.find(id)
    sql = "SELECT * FROM users WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return User.new(result.first)
  end

  def self.all()
    sql = "SELECT * FROM users"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |user| User.new( user ) }
  end

  def update()
    sql = "UPDATE burgers SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end


end
