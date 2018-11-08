require 'sinatra/base'
require './lib/database_connection_setup.rb'
require './lib/database_connection.rb'
require './lib/user'
require './lib/space.rb'


class Bnb < Sinatra::Base
  enable :sessions
  attr_reader :set_date


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
    @all_spaces = Space.all
    # in development
    # @all_spaces.each do |space|
    #   p JSON.generate({
    #     space_name: space.space_name,
    #     description: space.description,
    #     price_per_night: space.price_per_night
    #     })
    # end
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    #attempting to use if statement to show and hide availability #@set_date = false
    erb :'/spaces/new'
  end

  post '/spaces/:id' do
  #attempting to use if statement to show and hide availability  # @set_date = true
    Space.create(
      user_id: session[:user_id],
      space_name: params[:space_name],
      description: params[:description],
      price_per_night: params[:price_per_night]
    )
    redirect '/availability'
  end

  get '/availability' do
    erb :'/availability/index'
  end


  run! if app_file == $0
end
