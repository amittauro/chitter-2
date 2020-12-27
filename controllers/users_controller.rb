class Chitter < Sinatra::Base
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
end
