class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String,  required: true , unique: true
  property :password, BCryptHash, required: true

  has n, :comments
  belongs_to :role

  def self.login(username:, password:, app:)
    if username
      user = User.first(username: username) || User.first(email: username)
      if user.password == password
        app.session[:user] = user.id
        redirect_url = '/'
      else
        #app.flash[:error] = "#Ä€WKÄEFKDÖÄFKd"
        redirect_url = '/error'
      end
    end
    return redirect_url
  end

  def self.login(username:, email:, password:,password_confirmation:, app:)

    user = User.create( username: username, email: email,  password: password, role: Role.first)
    app.session[:user] = user.id
    if username.size < 3 or username.size > 15 or email.size < 5 or email.size > 32
      app.session[:error_msg] = 'Username or Email are too short'
      redirect_url = '/error'
    end
    if user.registered?(username) or user.registered_email?(email)
      app.session[:error_msg] = 'Username or email is already in use'
      redirect_url = '/error'
    end
    if password != password_confirmation
      app.session[:error_msg] = 'Password does not match'
      redirect_url = '/error'
    end

    return redirect_url
  end

  def registered?(username)
    User.all(username: username).any?
  end

  def registered_email?(email)
    User.all(email: email).any?
  end

  def authenticate?(password)
    if self.password == password
      return true
    else
      return false
    end
  end

end
