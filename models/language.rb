class Language
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :translations
  has n, :games, :through => :translations
end