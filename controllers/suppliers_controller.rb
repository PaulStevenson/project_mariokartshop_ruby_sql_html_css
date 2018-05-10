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

get '/dashboard/suppliers/:id' do
 @supplier = Supplier.find(params[:id])
 @items = @supplier.get_items()
 erb(:'/suppliers/show')
end

post '/dashboard/suppliers' do
 Supplier.new(params).save
 redirect to("/dashboard/suppliers")
end

get '/dashboard/suppliers/:id/edit' do
  @supplier = Supplier.find(params[:id])
  erb(:"suppliers/edit")
end

post '/dashboard/suppliers/:id' do
  supplier = Supplier.new(params)
  supplier.update
  redirect to '/dashboard/suppliers'
end


post '/dashboard/suppliers/:id/delete' do
  supplier = Supplier.find(params[:id])
  supplier.delete()
  redirect to '/dashboard/suppliers'
end

get'/dashboard/suppliers/:id' do
  @supplier = Supplier.find(params[:id])
  erb(:"suppliers/supplier")
end
