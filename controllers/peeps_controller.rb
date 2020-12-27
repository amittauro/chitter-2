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

  post '/peeps/:id' do
    peep = Peep.find(params['id'])
    binding.pry


    p params
  end

end
