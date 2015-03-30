require 'rubygems'
require 'bcrypt'
require 'sinatra'
require 'pony'

class App < Sinatra::Base
  enable :sessions

  # before 'filter' do
  #   if session[:user]
  #     @user = User.get(session[:user])
  #     if blalbalbalba
  #        @user = GuestUser.new
  #   end
  # end

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
    if session[:user]
      @user = User.get(session[:user])
    end
    @game = Game.first(id: params[:id])
    slim :game
  end

  post '/games/:id/:name' do
    if session[:user]
      @user = User.get(session[:user])
    end
    @game = Game.first(id: params[:id])
    User.get(session[:user])
    text = params['text']
    points = params['points']
    # Comment.create( comment: text, points: points, game_id: params[:id], user_id: @user.id )

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
    if session[:error_msg]
      @error = session[:error_msg]
    end
    slim :error
  end

  post '/logout' do
    session[:user] = nil
    redirect '/'
  end

  post '/login' do
    redirect_url = User.login(username: params['username'], password: params['password'], app: self)
    redirect redirect_url
  end

  post '/register' do
    redirect_url = User.register(username: params['username'], email: params['email'], password: params['password'],password_confirmation: params['password_confirmation'], app: self)
    redirect redirect_url
  end

  get '/termsandservice' do
    slim :termsandservice
  end

  get '/games/:game' do |game|
    @game = Game.get(game)

  end
end