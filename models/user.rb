class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, unique: true
  property :email, String
  property :password, BCryptHash
  property :membership, String

  has n, :comments
end

# hur man jämnför(man använder bara strängar): password == '123'
