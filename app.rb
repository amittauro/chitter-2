require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  enable :sessions

  get '/users/new' do
    erb :sign_up
  end

  post '/users' do
    if User.find_by(username: params['username']) || User.find_by(email: params['email'])
      flash[:notice] = 'User already exists please try a different username and email'
      redirect '/users/new'
    else
      user = User.new(email: params['email'], name: params['name'], username: params['username'])
      user.password = params['password']
      user.save!
      redirect '/sessions/new'
    end
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
