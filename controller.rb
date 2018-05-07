require('sinatra')
require('sinatra/contrib/all')
require_relative('models/item')
require_relative('models/supplier')
require('pry-byebug')

get '/items' do
  @items = Item.all
  erb(:index)
end
get '/items/suppliers' do
  @suppliers = Supplier.all
  erb(:supplier)
end
