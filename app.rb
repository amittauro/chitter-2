require 'sinatra'
require 'sinatra/activerecord'

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/users/new' do
    erb :sign_up
  end

  post '/users' do
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    'You have successfully signed up!'
  end
end
