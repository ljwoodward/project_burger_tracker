require_relative('../db/sql_runner.rb')

attr_reader(:name)

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
end

def save()
  sql = "INSERT INTO users (name) VALUES ($1) RETURNING id"
  values = [@name]
  results = SqlRunner.run(sql, values)
  @id = results[0]['id'].to_i
end