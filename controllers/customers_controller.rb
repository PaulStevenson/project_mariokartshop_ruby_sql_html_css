require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer')
require('pry-byebug')

get '/dashboard/customers' do
  @customers = Customer.all
  erb(:"customers/index")
end

post '/dashboard/customers' do
 Customer.new(params).save
 redirect to("/dashboard/customers")
end

get '/dashboard/customers/:id/edit' do
  @customer = Customer.find(params[:id])
  erb(:"customers/edit")
end

post '/dashboard/customers/:id' do
  customer = Customer.new(params)
  customer.update
  redirect to '/dashboard/customers'
end

post '/dashboard/customers/:id/delete' do
  customer = Customer.find(params[:id])
  customer.delete()
  redirect to '/dashboard/customers'
end


get'/dashboard/customers/:id' do
  @customer = Customer.find(params[:id])
  erb(:"customers/show")
end
