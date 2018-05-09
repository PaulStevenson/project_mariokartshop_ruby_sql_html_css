require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/item')
require_relative('../models/supplier')
require('pry-byebug')

get '/dashboard/items' do
  @items = Item.all
  erb(:"items/index")
end

get '/dashboard/items/new' do
  @suppliers = Supplier.all
  erb(:"items/new")
end

post '/dashboard/items' do
 Item.new(params).save
 redirect to("/dashboard/items")
end

get '/dashboard/items/:id/edit' do
  @item = Item.find(params[:id])
  @suppliers = Supplier.all
  erb(:"items/edit")
end

post '/dashboard/items/:id' do
  item = Item.new(params)
  item.update
  redirect to '/dashboard/items'
end

post '/dashboard/items/:id/delete' do
  item = Item.find(params[:id])
  item.delete()
  redirect to '/dashboard/items'
end

get'/dashboard/items/:id' do
  @item = Item.find(params[:id])
  erb(:"items/show")
end
