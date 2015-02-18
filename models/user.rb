class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String,  required: true , unique: true
  property :password, BCryptHash, required: true

  has n, :comments
  belongs_to :role

  def self.build(username:, email:, password:)
    role = Role.first_or_create(permission: 'User', description: 'Descr')
    self.create(username: username, email: email, password: password, role: role)
  end


end

# hur man jämnför(man använder bara strängar): password == '123'
