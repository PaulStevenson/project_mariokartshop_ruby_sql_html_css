require_relative('../db/sql_runner')
require('pry-byebug')


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

  def update()
    sql = 'UPDATE customers SET
    (name, contact)
    = ($1, $2)
    WHERE id = $3'
    values = [@name, @contact, @id]
    customer = SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM customers WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  ##CLASS
  def self.all()
    sql = 'SELECT * FROM customers'
    customer_details = SqlRunner.run(sql)
    return customer_details.map { |customer| Customer.new(customer)}
  end

  def self.find(id)
    sql = 'SELECT * FROM customers WHERE id =$1'
    values = [id]
    customer = SqlRunner.run(sql, values)
    result = Customer.new(customer[0])
    return result
  end

end
