class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String,  required: true , unique: true
  property :password, BCryptHash, required: true

  has n, :comments
  belongs_to :role

  def registered?(username)
    user = User.all
    user.each do |user|
      if user.username == username
        return true
      else
        return false
      end
    end
  end

  def registered_email?(email)
    user = User.all
    user.each do |user|
      if user.email == email
        return true
      else
        return false
      end
    end
  end

end
