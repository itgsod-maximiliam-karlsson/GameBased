class App < Sinatra::Base
  enable :sessions

  get '/' do
    slim :index
  end

  get '/register' do
    slim :register
  end

  post '/register' do
    username = params['username'].capitalize
    email = params['email']
    get_password = params['password']
    # tands = params['termsandservice']

    User.create( username: username, email: email,  password: get_password, role: Role.first)
    if username.size < 3 or username.size > 15 or email.size < 5 or email.size > 32 or tands == nil
      session[:error_msg] = 'Something went wrong'
      redirect '/register'
    else
      if User.registered? username or User.registered_email? email
        session[:error_msg] = 'Username or email is already in use'
        redirect '/register'
      else
        user = User.create( username: username, email: email,  password: get_password)

        session[:user_name] = user.username
        session[:user_id] = user.id
        session[:user_role] = user.role
        LoginLog.create(time: Time.now, user_id: user.id)
    
        redirect '/'
      end
    end
  end

  get '/termsandservice' do
    slim :termsandservice
  end

end