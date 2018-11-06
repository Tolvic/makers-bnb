require 'sinatra/base'
require './lib/database_connection_setup.rb'
require './lib/database_connection.rb'
require './lib/user'

class Bnb < Sinatra::Base
  enable :sessions
  
  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :"user/new"
  end

  post '/user' do
    user = User.create(
    name: params[:name],
    username: params[:username],
    telephone_number: params[:telephone_number],
    email_address: params[:email_address],
    password: params[:password]
    )
    session[:user_id] = user.id
    session[:username] = user.username
    redirect '/spaces'
  end

  get '/spaces' do
    @user_id = session[:user_id]
    @username = session[:username]
    erb :"/spaces/index"
  end

  run! if app_file == $0
end
