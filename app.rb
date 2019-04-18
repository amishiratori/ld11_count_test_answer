require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

get '/' do
  @counts = Count.all
  erb :index
end

post '/new' do
  Count.create({title: params[:title]})
  redirect '/'
end

post '/plus/:id' do
  count = Count.find(params[:id])
  count.update_column(:number, count.number + 1)
  redirect '/'
end

post '/minus/:id' do
  count = Count.find(params[:id])
  count.update_column(:number, count.number - 1)
  redirect '/'
end

post '/multiple/:id' do
  count = Count.find(params[:id])
  count.update_column(:number, count.number * 2)
  redirect '/'
end

post '/divide/:id' do
  count = Count.find(params[:id])
  count.update_column(:number, count.number / 2)
  redirect '/'
end

post '/clear/:id' do
  count = Count.find(params[:id])
  count.update_column(:number, 0)
  redirect '/'
end