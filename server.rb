require 'sinatra'
require 'sinatra/reloader'
require 'pry'

def read_file(filename)
  File.readlines(filename)
end

get '/groceries' do
  @file = read_file('grocery_list.txt')
  erb :index
end

post '/groceries' do
  food = params['food']
  File.open("grocery_list.txt", "a") do |f|
    f.puts(food)
  end
  redirect '/groceries'
end
