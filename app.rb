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
    erb :log_in
  end

  post '/sessions' do
    redirect '/peeps/new'
  end

  get '/peeps/new' do
    'You have succesfully logged in!'
  end
end
