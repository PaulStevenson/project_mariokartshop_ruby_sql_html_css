require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('controllers/items_controller')
require_relative('controllers/suppliers_controller')

get '/dashboard' do
  erb(:index)
end
