require 'sinatra/base'
require './lib/mock'
require './lib/database_connection_setup.rb'

class Bnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
