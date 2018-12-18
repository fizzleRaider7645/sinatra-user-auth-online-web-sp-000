class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:id] = @user.id
    redirect '/users/home'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
<<<<<<< HEAD
    @user = User.find_by(email: params["email"], password: params["password"])
    
    if @user.nil?
      redirect "/sessions/login"
    else 
      session[:id] = @user.id
      redirect '/users/home'
    end
=======
    redirect '/users/home'
>>>>>>> ead7aaa7a898c9fc4567469557ad5145764b1b08
  end

  get '/sessions/logout' do 
    session.clear
    redirect '/'
  end

  get '/users/home' do
    @user = User.find(session[:id])
    erb :'/users/home'
  end

end
