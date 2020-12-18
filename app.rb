require 'sinatra'

class Chitter < Sinatra::Base

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
