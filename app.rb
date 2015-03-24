require 'rubygems'
require 'bcrypt'
require 'sinatra'

class App < Sinatra::Base
  enable :sessions

  get '/' do
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

  post '/login' do
    username = params['username']
    password = params['password']
    user = User.first(username)

    if user.authenticate?(password)
      session[:member] = true
      redirect '/'
    else
      redirect '/Wrong'
    end
  end

  post '/register' do
    username = params['username']
    email = params['email']
    get_password = params['password']
    # tands = params['termsandservice']

    user = User.create( username: username, email: email,  password: get_password, role: Role.first)
    session[:user_name] = user.username
    session[:user_id] = user.id
    session[:user_role] = user.role
    if username.size < 3 or username.size > 15 or email.size < 5 or email.size > 32
      session[:error_msg] = 'Something went wrong'
      redirect '/register'
    end
    if user.registered?(username) or user.registered_email?(email)
        session[:error_msg] = 'Username or email is already in use'
        redirect '/register'
    end
  end

  get '/termsandservice' do
    slim :termsandservice
  end
end