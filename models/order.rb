require_relative('../db/sql_runner')
require_relative('customer')
require_relative('item')
require('pry-byebug')

class Order

  attr_reader :id
  attr_accessor :item_id, :customer_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @item_id = options['item_id'].to_i
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = 'INSERT INTO orders (
    item_id, customer_id)
    VALUES ($1, $2)
    RETURNING id'
    values = [@item_id, @customer_id]
    order = SqlRunner.run(sql, values)[0]
    @id = order['id'].to_i
  end

  def customer
    customer = Customer.find(@customer_id)
    return customer
  end

  def item
    item = Item.find(@item_id)
    return item
  end

  def update
    sql = 'UPDATE orders SET
    (item_id, customer_id)
    = ($1, $2)
    WHERE id = $3'
    values = [@item_id, @customer_id, @id]
    order = SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM orders WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  ##CLASS
  def self.all()
    sql = 'SELECT * FROM orders'
    order_details = SqlRunner.run(sql)
    return order_details.map { |order| Order.new(order)}
  end

  def self.find(id)
    sql = 'SELECT * FROM orders WHERE id =$1'
    values = [id]
    order = SqlRunner.run(sql, values)
    result = Order.new(order[0])
    return result
  end


end
