require('sinatra')
require('sinatra/contrib/all')
require_relative('models/item')
require_relative('models/supplier')
require('pry-byebug')

get '/dashboard' do
  erb(:index)
end

get '/dashboard/items' do
  @items = Item.all
  erb(:"items/items")
end

get '/dashboard/suppliers' do
  @suppliers = Supplier.all
  erb(:"suppliers/suppliers")
end

get '/dashboard/items/new_item' do
  erb(:"items/new_item")
end

get '/dashboard/suppliers/new_supplier' do
  erb(:"suppliers/new_supplier")
end

get 'dashboard/items/:id/edit' do
  @item = Item.find(params[:id])
  erb(:"items/edit_item")

end

get'/dashboard/items/:id' do
  @item = Item.find(params[:id])
  erb(:"items/show_item")
end
