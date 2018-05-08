require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/supplier')
require('pry-byebug')

get '/dashboard/suppliers' do
  @suppliers = Supplier.all
  erb(:"suppliers/index")
end

get '/dashboard/suppliers/new' do
  erb(:"suppliers/new")
end

post '/dashboard/suppliers' do
 Supplier.new(params).save
 redirect to("/dashboard/suppliers")
end

get'/dashboard/suppliers/:id' do
  @supplier = Supplier.find(params[:id])
  erb(:"suppliers/supplier")
end
