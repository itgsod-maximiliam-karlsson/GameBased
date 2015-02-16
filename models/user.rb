class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String,  required: true , unique: true
  property :password, BCryptHash, required: true

  has n, :comments
  belongs_to :membership


  after :create do
    Membership.create(user: self, permission: 'user', description: 'Regular user')
  end
end

# hur man jämnför(man använder bara strängar): password == '123'
