require_relative('../db/sql_runner')


class Customer

  attr_reader :id
  attr_accessor :name, :contact

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact = options['contact']
  end

  def save()
    sql = 'INSERT INTO customers (
    name, contact)
    VALUES ($1, $2)
    RETURNING id'
    values = [@name, @contact]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
  end
end
