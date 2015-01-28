class Company
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :rating, Integer
  property :description, Text

  has n, :company_games
  has n, :games, :through => :company_games

  has n, :types
end