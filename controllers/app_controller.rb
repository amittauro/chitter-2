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
  set :root, File.dirname(File.expand_path('..', __FILE__))

  get '/' do
    erb :index
  end
end
