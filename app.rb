class App < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello!"
  end

end