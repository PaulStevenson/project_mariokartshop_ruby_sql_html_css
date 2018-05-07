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
  erb(:suppliers)
end

get '/items/new_item' do
  erb(:new_item)
end

get'/items/:id' do
  @item = Item.find(params[:id])
  erb(:show_item)
end
