require_relative('../db/sql_runner')

class Item

  attr_reader :id, :name, :description, :purchase_cost, :RRP, :category, :supplier_id
  attr_accessor :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @quantity = options['quantity'].to_i
    @purchase_cost = options['purchase_cost'].to_i
    @RRP = options['RRP'].to_i
    @category = options['category']
    @supplier_id = options['supplier_id'].to_i
  end

  def save()
    sql = 'INSERT INTO items (
    name, description, quantity, purchase_cost, RRP, category, supplier_id)
    VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id'
    values = [@name, @description, @quantity, @purchase_cost, @RRP, @category, @supplier_id]
    item = SqlRunner.run(sql, values)[0]
    @id = item['id'].to_i
  end

  def update()
    sql = 'UPDATE items SET
    (name, description, quantity, purchase_cost, RRP, category, supplier_id)
    = ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8'
    values = [@name, @description, @quantity, @purchase_cost, @RRP, @category, @supplier_id]
    item = SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM items WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  ##CLASS
  def self.all()
    sql = 'SELECT * FROM items'
    item_details = SqlRunner.run(sql)
    return item_details.map { |item| Item.new(item)}
  end

  def self.find(id)
    sql = 'SELECT * FROM items WHERE id =$1'
    values = [id]
    item = SqlRunner.run(sql, values)
    result = Item.new(item[0])
    return result
  end
end
