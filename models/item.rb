require_relative('../db/sql_runner')

class Item

  attr_reader :id, :name, :description, :purchase_cost, :RRP, :category
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


end
