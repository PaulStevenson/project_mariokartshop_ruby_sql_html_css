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

  def update
    sql = 'UPDATE items SET
    (name)
    = ($1)
    WHERE id = $2'
    values = [@name]
    item = SqlRunner.run(sql, values)
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
    sql = 'SELECT * FROM suppliers WHERE i =$1'
    values = [id]
    supplier = SqlRunner.run(sql, values)
    result = Supplier.new(supplier[0])
    return result
  end


end
