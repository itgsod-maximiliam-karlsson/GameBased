class App < Sinatra::Base
  enable :sessions

  get '/' do
    @users = User.all
    slim :index
  end


end