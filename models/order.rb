require_relative('../db/sql_runner')
require_relative('customer')
require_relative('item')

class Order
  attr_reader :item_id, :customer_id

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
end
