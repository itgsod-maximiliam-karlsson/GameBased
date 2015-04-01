class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true,
           messages: {presence: "You must enter a username",
                      is_unique: "Username is already in use"}
  property :email, String,  required: true , unique: true,
           messages: {
               presence: "You must enter an Email address",
               is_unique: "Email is already in use"}

  property :password, BCryptHash, required: true

  validates_length_of :username, length: 4, message: "Username is too short"

  has n, :comments
  belongs_to :role

  def self.login(username:, password:, app:)
    if username
      user = User.first(username: username) || User.first(email: username)
      if user.respond_to?('password')
        if user.password == password
          app.session[:user] = user.id
          redirect_url = '/'
        else
          #app.flash[:error] = "#Ä€WKÄEFKDÖÄFKd"
          redirect_url = '/error'
        end
      else
        redirect_url = '/error'
      end
    end
    return redirect_url
  end

  def self.register(params, app:)

    user = User.create( username: params['username'], email: params['email'],  password: params['password'], role: Role.first)
    if params['password'] != params['password_confirmation']
      app.flash[:errors] = ['Password does not match']
      return '/error'
    end
    if user.valid?
      app.session[:user] = user.id
      redirect_url = app.back
    else
      app.flash[:errors] = user.errors.to_a.flatten
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
