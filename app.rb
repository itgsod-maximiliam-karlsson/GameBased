require 'rubygems'
require 'bcrypt'
require 'sinatra'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    if session[:user]
      @user = User.get(session[:user])
    end
    @games = Game.all
    @users = User.all
    slim :index
  end

  get '/register' do
    slim :register
  end

  get '/login' do
    @users = User.all
    slim :login
  end

  get '/forgotpassword' do
    slim :forgotpassword
  end

  get '/error' do
    slim :error
  end

  post '/logout' do
    session[:user] = nil
    redirect '/'
  end

  post '/login' do
    #hämta användaren med namnet som står i params
    user = User.first(username: params['username'])
    if user && user.password == params['password']
      session[:user] = user.id
      redirect '/'
    else
      redirect '/error'
    end
  end


  post '/register' do
    username = params['username']
    email = params['email']
    get_password = params['password']
    # tands = params['termsandservice']

    user = User.create( username: username, email: email,  password: get_password, role: Role.first)
    session[:user] = user.id
    if username.size < 3 or username.size > 15 or email.size < 5 or email.size > 32
      session[:error_msg] = 'Something went wrong'
      redirect '/register'
    end
    if user.registered?(username) or user.registered_email?(email)
      session[:error_msg] = 'Username or email is already in use'
      redirect '/register'
    end

    redirect '/'
  end

  get '/termsandservice' do
    slim :termsandservice
  end
end