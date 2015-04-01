class Game
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true, unique: true
  property :description, Text, required: true
  property :base_language_id, Integer, required: true
  property :release_date, String
  property :rating, Integer
  property :user_rating, Integer
  property :img, Text
  property :category, String, required: true


  has n, :company_games
  has n, :companies, :through => :company_games

  has n, :translations
  has n, :languages, :through => :translations

  has n, :taggings
  has n, :tags, :through => :taggings

  has n, :comments
end