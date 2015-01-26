class App < Sinatra::Base
  enable :sessions

  get '/' do
    "Eyo!"
  end

end