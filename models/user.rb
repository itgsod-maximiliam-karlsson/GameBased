class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String,  required: true , unique: true
  property :password, BCryptHash, required: true

  has n, :comments
  belongs_to :role
  
end

# hur man jämnför(man använder bara strängar): password == '123'
