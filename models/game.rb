class Game
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :tags
  property :language
  property :release_date
  property :rating
  
  has n, :something

end