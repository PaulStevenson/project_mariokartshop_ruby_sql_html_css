require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/order')
require_relative('../models/item')
require_relative('../models/customer')
require('pry-byebug')

get '/dashboard/orders' do
  @orders = Order.all
  erb(:"orders/index")
end

get '/dashboard/orders/new' do
  erb(:"orders/new")
end

post '/dashboard/orders' do
 Order.new(params).save
 redirect to("/dashboard/orders")
end

get '/dashboard/orders/:id/edit' do
  @order = Order.find(params[:id])
  erb(:"orders/edit")
end

post '/dashboard/orders/:id' do
  order = Order.new(params)
  order.update
  redirect to '/dashboard/orders'
end

post '/dashboard/orders/:id/delete' do
  order = Order.find(params[:id])
  order.delete()
  redirect to '/dashboard/orders'
end

get'/dashboard/orders/:id' do
  @order = Order.find(params[:id])
  erb(:"orders/show")
end
