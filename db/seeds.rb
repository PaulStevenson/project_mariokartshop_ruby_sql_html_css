require_relative('../models/item')
require_relative('../models/supplier')
require_relative('../models/customer')
require_relative('../models/order')
require('pry-byebug')

supplier1 = Supplier.new({
  'name' => 'Toad Mushroom Powered',
  'location' => 'Mushroom Kingdom',
  'representative' => 'Toad'})

supplier2 = Supplier.new({
  'name' => 'Red Shell Strike Equipment',
  'location' => 'Mushroom Kingdom',
  'representative' => 'Bowser'})

supplier3 = Supplier.new({
  'name' => 'Rainbow Exploration Agency',
  'location' => 'Mushroom Kingdom',
  'representative' => 'Mario'})

supplier4 = Supplier.new({
  'name' => 'Banana Boy',
  'location' => 'Mushroom Kingdom',
  'representative' => 'Donkey Kong'})

supplier1.save()
supplier2.save()
supplier3.save()
supplier4.save()

customer1 = Customer.new({
  'name' => 'Mario',
  'contact' => 'mario@noa.nintendo.com'
  })


customer2 = Customer.new({
  'name' => 'Bowser',
  'contact' => 'bowser@noa.nintendo.com'
  })

  customer1.save()
  customer2.save()

customer1.save()
customer2.save()

item1 = Item.new({
  'name' => 'Green Shell',
  'description' => 'A simple projectile',
  'quantity' => 200,
  'purchase_cost' => 5,
  'rrp' => 12,
  'category' => 'Attack',
  'supplier_id' => supplier2.id
})
item1.save()

item2 = Item.new({
  'name' => 'Red Shell',
  'description' => 'Homing projectile targeting the closest racer',
  'quantity' => 200,
  'purchase_cost' => 14,
  'rrp' => 30,
  'category' => 'Attack',
  'supplier_id' => supplier2.id
})
item2.save()

item4 = Item.new({
  'name' => 'Blue Shell',
  'description' => 'Homing nuke, seeks out racer in first position',
  'quantity' => 10,
  'purchase_cost' => 28,
  'rrp' => 60,
  'category' => 'Attack',
  'supplier_id' => supplier2.id
})
item4.save()

item3 = Item.new({
  'name' => 'Banana',
  'description' => 'A trap, spinning out the target',
  'quantity' => 500,
  'purchase_cost' => 2,
  'rrp' => 5,
  'category' => 'Defence',
  'supplier_id' => supplier4.id
  })
item3.save()

item5 = Item.new({
  'name' => 'Mushroom',
  'description' => 'Provides a speed boost',
  'quantity' => 250,
  'purchase_cost' => 5,
  'rrp' => 10,
  'category' => 'Boost',
  'supplier_id' => supplier1.id})
item5.save()

item6 = Item.new({
  'name' => 'Golden Mushroom',
  'description' => 'Provides multiple speed boosts for a short duration',
  'quantity' => 250,
  'purchase_cost' => 15,
  'rrp' => 40,
  'category' => 'Boost',
  'supplier_id' => supplier1.id})
item6.save()

item7 = Item.new({
  'name' => 'Star',
  'description' => 'Grants temporary invincibility and a speed boost',
  'quantity' => 5,
  'purchase_cost' => 35,
  'rrp' => 100,
  'category' => 'Boost',
  'supplier_id' => supplier3.id
})
item7.save()

order1 = Order.new({
  'customer_id' => customer1.id,
  'item_id' => item7.id})

order2 = Order.new({
  'customer_id' => customer2.id,
  'item_id' => item2.id})
order1.save()
order2.save()

binding.pry
