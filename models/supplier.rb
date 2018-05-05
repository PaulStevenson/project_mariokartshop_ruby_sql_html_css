require_relative('../db/sql_runner')

class Supplier
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = 'INSERT INTO suppliers (name)
    VALUES ($1)
    RETURNING id'
    values = [@name]
    supplier = SqlRunner.run(sql, values)[0]
    @id = supplier['id'].to_i
  end


end
