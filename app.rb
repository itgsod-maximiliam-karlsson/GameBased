require 'rubygems'
require 'bcrypt'
require 'sinatra'
require 'pony'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    if session[:user]
      @user = User.get(session[:user])
    end
    @games = Game.all
    # (:order => [ :rating.desc ])
    @users = User.all
    slim :index
  end

  get '/newest_games' do
    if session[:user]
      @user = User.get(session[:user])
    end
    @games = Game.all
    # (:order => [ :rating.desc ])
    @users = User.all
    slim :newest_games
  end

  get '/games/:id/:name' do
    @game = Game.find(params[:id])
    slim :game
  end


  get '/register' do
    slim :register
  end

  get '/category' do
    if session[:user]
      @user = User.get(session[:user])
    end
    @games = Game.all
    # (:order => [ :rating.desc ])
    @users = User.all
    slim :category
  end

  get '/login' do
    @users = User.all
    slim :login
  end

  get '/forgotpassword' do
    slim :forgotpassword
  end

  post '/forgotpassword' do
    Pony.mail :to => params['email'],
    :from => 'fuckyou@getrekt.com',
    :subject => "You don't desire a new password"
  end

  get '/error' do
    slim :error
  end

  post '/logout' do
    session[:user] = nil
    redirect '/'
  end

  post '/login' do
    if params['username'].empty? == false
      user = User.first(username: params['username'])
      if user.respond_to?('password')
        if user.password == params['password']
          session[:user] = user.id
          redirect '/'
        else
          redirect '/error'
        end
      else
        user = User.first(email: params['username'])
        if user.respond_to?('password')
          if user.password == params['password']
            session[:user] = user.id
            redirect '/'
          else
            redirect '/error'
          end
        else
          redirect '/error'
        end
        redirect '/error'
      end
    else
      redirect '/error'
    end
  end


  # post '/login' do
  #   if params['username'].empty? == false
  #     user = User.first(username: params['username'])
  #     if user.respond_to?('password')
  #       if user.password == params['password']
  #         session[:user] = user.id
  #         redirect '/'
  #       else
  #         redirect '/error'
  #       end
  #     else
  #       redirect '/error'
  #     end
  #   else
  #     redirect '/error'
  #   end
  # end


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

  get '/games/:game' do |game|
    @game = Game.get(game)

  end
end