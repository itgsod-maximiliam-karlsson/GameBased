class Game
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :tags, String
  property :language, String
  property :release_date, Date
  property :rating, Integer

  has n, :company
  has n, :developer
  has n, :comment

end