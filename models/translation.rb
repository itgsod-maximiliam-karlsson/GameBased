class Translation
  include DataMapper::Resource

  belongs_to :game, :key => true
  belongs_to :language, :key => true
end