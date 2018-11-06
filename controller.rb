require 'sinatra/base'
require './lib/space.rb'
require './lib/database_connection_setup.rb'
require './lib/database_connection.rb'


class Bnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/spaces' do
    @all_spaces = Space.all
    # in development
    # @all_spaces.each do |space|
    #   p JSON.generate({
    #     space_name: space.space_name,
    #     description: space.description,
    #     price_per_night: space.price_per_night
    #     })
    end
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  post '/spaces' do
    Space.create(
      user_id: params[:user_id],
      space_name: params[:space_name],
      description: params[:description],
      price_per_night: params[:price_per_night]
    )
    redirect '/spaces'
  end

  run! if app_file == $0
end
