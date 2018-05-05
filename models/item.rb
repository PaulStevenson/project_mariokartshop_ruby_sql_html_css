require_relative('../db/sql_runner')

class Item

  attr_reader :id, :name, :description, :purchase_cost, :RRP, :category
  attr_accessor :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @quantity = opions['quantity'].to_i
    @purchase_cost = opions['purchase_cost'].to_i
    @RRP = opions['RRP'].to_i
    @category = options['category']
    @supplier_id = options['supplier_id'].to_i
  end

end
