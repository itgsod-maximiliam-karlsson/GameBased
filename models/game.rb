class Game
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :base_language_id, Integer
  property :release_date, String
  property :rating, Integer

  has n, :company_games
  has n, :companies, :through => :company_games

  has n, :translations
  has n, :languages, :through => :translations

  has n, :taggings
  has n, :tags, :through => :taggings

  has n, :comments
end