require_relative('../models/item')
require_relative('../models/supplier')
require('pry-byebug')


supplier1 = Supplier.new({'name' => 'Toad Mushroom Powered'})

supplier2 = Supplier.new({'name' => 'Red Shell Strike Equipment'})

supplier3 = Supplier.new({'name' => 'Rainbow Exploration Agency'})

supplier4 = Supplier.new({'name' => 'Banana Boy'})

item1 = Item.new({
  'name' => 'Green Shell',
  'description' => 'A simple projectile',
  'quantity' => 200,
  'purchase_cost' => 5,
  'RRP' => 12,
  'category' => 'Attack',
  'supplier_id' => supplier2.id
})

item2 = Item.new({
  'name' => 'Red Shell',
  'description' => 'Homing projectile targeting the closest racer',
  'quantity' => 200,
  'purchase_cost' => 14,
  'RRP' => 30,
  'category' => 'Attack',
  'supplier_id' => supplier2.id
})

item4 = Item.new({
  'name' => 'Blue Shell',
  'description' => 'Homing nuke, seeks out racer in first position',
  'quantity' => 10,
  'purchase_cost' => 28,
  'RRP' => 60,
  'category' => 'Attack',
  'supplier_id' => supplier2.id
})

item3 = Item.new({
  'name' => 'Banana',
  'description' => 'A trap, spinning out the target',
  'quantity' => 500,
  'purchase_cost' => 2,
  'RRP' => 5,
  'category' => 'Defence',
  'supplier_id' => supplier4.id})

item5 = Item.new({
  'name' => 'Mushroom',
  'description' => 'Provides a speed boost',
  'quantity' => 250,
  'purchase_cost' => 5,
  'RRP' => 10,
  'category' => 'Boost',
  'supplier_id' => supplier1.id})

item6 = Item.new({
  'name' => 'Golden Mushroom',
  'description' => 'Provides multiple speed boosts for a short duration',
  'quantity' => 250,
  'purchase_cost' => 15,
  'RRP' => 40,
  'category' => 'Boost',
  'supplier_id' => supplier1.id})

item7 = Item.new({
  'name' => 'Star',
  'description' => 'Grants temporary invincibility and a speed boost',
  'quantity' => 5,
  'purchase_cost' => 35,
  'RRP' => 100,
  'category' => 'Boost',
  'supplier_id' => supplier3.id
})

binding.pry
