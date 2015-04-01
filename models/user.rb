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
          app.flash[:error] = "Wrong password!"
          redirect_url = app.back

        end
      else
        app.flash[:error] = "Username does not exist"
        redirect_url = app.back
      end
    end
    return redirect_url
  end

  def self.register(params:, app:)
    user = User.create(username: params['username'],
                       email: params['email'],
                       password: params['password'],
                       role: Role.first)
    if user.valid?
      app.session[:user] = user.id
      # redirect_url = app.back
      redirect_url = '/'
    else
      app.flash[:errors] = user.errors.to_a.flatten
      redirect_url = app.back
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
