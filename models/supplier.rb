require_relative('../db/sql_runner')
require('pry-byebug')

class Supplier
  attr_reader :id
  attr_accessor :name, :location, :representative

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @location = options['location']
    @representative = options['representative']
  end

  def save()
    sql = 'INSERT INTO suppliers (name, location, representative)
    VALUES ($1, $2, $3)
    RETURNING id'
    values = [@name, @location, @representative]
    supplier = SqlRunner.run(sql, values)[0]
    @id = supplier['id'].to_i
  end

  def update
    sql = 'UPDATE suppliers SET
    (name, location, representative)
    = ($1, $2, $3)
    WHERE id = $4'
    values = [@name, @location, @representative, @id]
    item = SqlRunner.run(sql, values)
  end

  def get_items()
     sql = "SELECT * FROM items WHERE supplier_id = $1"
     values = [@id]
     results = SqlRunner.run(sql, values)
     return results.map {|result| Item.new(result)}
   end

  def delete()
    sql = 'DELETE FROM suppliers WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  ##CLASS
  def self.all()
    sql = 'SELECT * FROM suppliers'
    supplier_details = SqlRunner.run(sql)
    return supplier_details.map { |supplier| Supplier.new(supplier)}
  end

  def self.find(id)
    sql = 'SELECT * FROM suppliers WHERE id =$1'
    values = [id]
    supplier = SqlRunner.run(sql, values)
    result = Supplier.new(supplier[0])
    return result
  end


end
