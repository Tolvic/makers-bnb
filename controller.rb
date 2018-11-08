require 'sinatra/base'
require 'sinatra/flash'
require './lib/database_connection_setup.rb'
require './lib/database_connection.rb'
require './lib/user'
require './lib/space.rb'


class Bnb < Sinatra::Base
  enable :sessions
<<<<<<< HEAD
  attr_reader :set_date

=======
  register Sinatra::Flash
>>>>>>> b4ad38fad77f258803f6434cc94ea34c264557fb

  get '/' do
    redirect '/spaces' if session[:user_id]
    erb :index
  end

  get '/user/new' do
    erb :"user/new"
  end

  post '/user' do
    if User.already_registered?(username: params[:username],
    telephone_number: params[:telephone_number],
    email_address: params[:email_address])
      flash[:notice] = "Credentials have already been used by another user."
      redirect '/user/new'
    else
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
  end

  get '/spaces' do
    redirect '/' unless session[:user_id]
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
<<<<<<< HEAD
    #attempting to use if statement to show and hide availability #@set_date = false
=======
    redirect '/' unless session[:user_id]

>>>>>>> b4ad38fad77f258803f6434cc94ea34c264557fb
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

<<<<<<< HEAD
  get '/availability' do
    erb :'/availability/index'
  end

=======
  get '/session/new' do
    erb :'/session/new'
  end

  post '/session' do
    user = User.authenticate(username: params[:username], password: params[:password])

    if user
      session[:user_id] = user.id
      session[:username] = user.username
      redirect('/spaces')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/session/new')
    end

  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end
>>>>>>> b4ad38fad77f258803f6434cc94ea34c264557fb

  run! if app_file == $0
end
