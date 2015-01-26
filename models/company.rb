class Company
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :rating, Integer
  property :description, Text

  has n, :type
  has n, :game
end