require 'sinatra/base'
require './lib/mock'

class Bnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    session[:a] = params[:a]
    session[:b] = params[:b]
  end

  get '/answer' do
    p session[:a]
    @mock = Mock.new
    @answer = @mock.add(session[:a].to_i, session[:b].to_i)
    JSON.generate({
      answer: @answer
      })
  end

  run! if app_file == $0
end 
