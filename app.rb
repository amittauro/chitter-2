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
    if User.exists?(username: params['username'], email: params['email'])
      flash[:notice] = 'User already exists please try a different username and email'
      redirect '/users/new'
    else
      User.create_with_bcrypt(
        email: params['email'], name: params['name'],
        username: params['username'], password: params['password']
      )
      flash[:notice] = 'You have successfully signed up!'
      redirect '/sessions/new'
    end
  end

  get '/sessions/new' do
    erb :log_in
  end

  post '/sessions' do
    user = User.find_by_email(params[:email])
    if user.password == params[:password]
      session[:user] = params['email']
      redirect '/peeps/new'
    else
      flash[:notice] = 'Invalid password please try again'
      redirect '/sessions/new'
    end
  end

  get '/peeps/new' do
    'You have succesfully logged in!'
  end
end
