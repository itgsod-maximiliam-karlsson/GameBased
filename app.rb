require 'rubygems'
require 'bcrypt'
require 'sinatra'
require 'sinatra/flash'
require 'rack-flash'
require 'pony'

class App < Sinatra::Base
  enable :sessions
  use Rack::Flash

  before do
    if session[:user]
      @user = User.get(session[:user])
      # if blalbalbalba
      #    @user = GuestUser.new
      # end
    end
  end

  get '/' do
    @games = Game.all
    # (:order => [ :rating.desc ])
    @users = User.all
    slim :index
  end

  get '/newest_games' do

    @games = Game.all
    # (:order => [ :rating.desc ])
    @users = User.all
    slim :newest_games
  end

  get '/games/:id/:name' do
    @game = Game.first(id: params[:id])
    @comments = Comment.all
    @users = User.all
    slim :game
  end

  post '/games/:id/:name' do
    @game = Game.first(id: params[:id])
    user_id = @user.id
    text = params['text']
    points = params['points']
    Comment.create( comment: text, points: points, game_id: params[:id], user_id: user_id )
    redirect back
  end

  get '/category' do
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
    if flash[:errors]
      @error = flash[:errors]
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
    redirect_url = User.register(params: params, app: self)
    redirect redirect_url
  end

  get '/termsandservice' do
    slim :termsandservice
  end

  get '/games/:game' do |game|
    @game = Game.get(game)

  end
end