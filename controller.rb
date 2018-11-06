require 'sinatra/base'
require './lib/mock'
require './lib/database_connection_setup.rb'

class Bnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/spaces' do
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  post '/spaces' do
    redirect '/spaces'
  end

  run! if app_file == $0
end
