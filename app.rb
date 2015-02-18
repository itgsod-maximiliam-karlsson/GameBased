class App < Sinatra::Base
  enable :sessions

  get '/' do
    @comments = Comment.all
    @companies = Company.all
    @games = Game.all
    @languages = Language.all
    @roles = Role.all
    @tags = Tag.all
    @types = Type.all
    @users = User.all
    slim :index
  end


end