class Comment
  include DataMapper::Resource

  property :id, Serial
  property :comment, Text, required: true
  property :points, Integer

  belongs_to :game
  belongs_to :user
end