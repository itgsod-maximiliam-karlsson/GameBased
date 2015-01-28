class Game
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :tags, String
  property :language, String
  property :release_date, String
  property :rating, Integer

  has n, :company_games
  has n, :companies, :through => :company_games

  has n, :comments
end