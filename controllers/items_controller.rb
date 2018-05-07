require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/item')
require('pry-byebug')

get '/dashboard/items' do
  @items = Item.all
  erb(:"items/items")
end

get '/dashboard/items/new_item' do
  erb(:"items/new_item")
end

get 'dashboard/items/:id/edit' do
  @item = Item.find(params[:id])
  erb(:"items/edit_item")
end

get'/dashboard/items/:id' do
  @item = Item.find(params[:id])
  erb(:"items/show_item")
end
