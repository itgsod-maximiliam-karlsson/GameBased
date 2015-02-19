class Company
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true, unique: true
  property :rating, Integer
  property :description, Text, required: true

  has n, :company_games
  has n, :games, :through => :company_games

  has n, :types
end