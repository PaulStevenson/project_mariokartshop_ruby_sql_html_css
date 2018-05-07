require('sinatra')
require('sinatra/contrib/all')
require_relative('models/item')
require_relative('models/supplier')
require('pry-byebug')

get '/items' do
  @items = Item.all
  erb(:index)
end
