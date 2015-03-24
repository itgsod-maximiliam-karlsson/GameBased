class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String,  required: true , unique: true
  property :password, BCryptHash, required: true

  has n, :comments
  belongs_to :role

  def registered?(username)
    User.username.each do |user|
      if user == username
        return true
      else
        return false
      end
    end
  end
end
