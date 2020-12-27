class Chitter < Sinatra::Base
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
end
