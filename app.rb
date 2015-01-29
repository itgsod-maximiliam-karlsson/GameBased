class App < Sinatra::Base
  enable :sessions

  get '/' do
    #p User.all
  end

end