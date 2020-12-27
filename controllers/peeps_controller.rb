class Chitter < Sinatra::Base
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

  patch '/peeps/:id' do
    peep = Peep.find(params['id'])
    peep.update_tags(session[:user])
    flash[:notice] = "You tagged message: #{peep.message}"
    redirect '/peeps'
  end

end
