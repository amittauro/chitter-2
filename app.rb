require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'date'
require './models/user'
require './models/peep'

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  enable :sessions
  enable :method_override

  get '/' do
    erb :index
  end

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
      redirect '/session/new'
    end
  end

  get '/session/new' do
    erb :log_in
  end

  post '/session' do
    user = User.find_by_email(params[:email])
    if user.password == params[:password]
      session[:user] = user.id
      flash[:notice] = 'You have succesfully logged in!'
      redirect '/peeps/new'
    else
      flash[:notice] = 'Invalid password please try again'
      redirect '/session/new'
    end
  end

  delete '/session' do
    user_id = session.delete(:user)
    user = User.find_by(id: user_id)
    flash[:notice] = "#{user.username} you have succesfully signed out"
    redirect '/'
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps' do
    Peep.create(user_id: session[:user], message: params['peep'], time: DateTime.now)

    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.reverse_order
    erb :peeps
  end
end
