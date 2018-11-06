require 'sinatra/base'
require './lib/mock'
require './lib/database_connection_setup.rb'

class Bnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :"user/new"
  end

  post '/user' do
    # user = User.create(
    # name: params[:name],
    # username: params[:username],
    # telephone_number: params[:telephone_number],
    # email_address: params[:email_address],
    # password: params[:password]
    # )
    # session[:name] = params[:name]
    redirect '/spaces'
  end

  get '/spaces' do
    erb :"/spaces/index"
  end

  run! if app_file == $0
end
