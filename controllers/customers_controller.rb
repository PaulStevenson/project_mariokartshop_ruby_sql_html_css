require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer')
require('pry-byebug')

get '/dashboard/customers' do
  @customers = Customer.all
  erb(:"customers/index")
end
