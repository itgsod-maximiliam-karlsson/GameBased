class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String
  property :password, Text
  property :membership, String

  has n, :comments
end