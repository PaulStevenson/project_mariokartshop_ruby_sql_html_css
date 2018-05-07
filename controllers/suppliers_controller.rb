require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/supplier')
require('pry-byebug')

get '/dashboard/suppliers' do
  @suppliers = Supplier.all
  erb(:"suppliers/suppliers")
end


get '/dashboard/suppliers/new_supplier' do
  erb(:"suppliers/new_supplier")
end

post '/dashboard/suppliers/new_supplier' do
 Supplier.new params.save
 erb(:"suppliers/success")
end

get'/dashboard/suppliers/:id' do
  @supplier = Supplier.find(params[:id])
  erb(:"suppliers/show_supplier")
end
