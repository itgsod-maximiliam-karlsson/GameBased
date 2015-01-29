class Tagging
  include DataMapper::Resource

  belongs_to :game, :key => true
  belongs_to :tag, :key => true
end