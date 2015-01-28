class Comment
  include DataMapper::Resource

  property :id, Serial
  property :type, String
  property :comment, Text
  property :like, Integer
  property :dislike, Integer

  belongs_to :game
  belongs_to :user
end