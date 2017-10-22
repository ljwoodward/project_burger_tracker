require_relative('../db/sql_runner.rb')

attr_reader(:name, :url)

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @url = options['url']
end

def save()
  sql = "INSERT INTO eateries (name, url) VALUES ($1, $2) RETURNING id"
  values = [@name, @url]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i
end
