require 'sinatra'
require './utils'

# GET /

get '/' do
  @links = ['rot13', 'signup']
  erb :index
end

# GET /rot13

get '/rot13' do
  erb :rot13
end

# POST /rot13

post '/rot13' do
  @text = rot13(params[:text])
  erb :rot13
end

# GET /signup

get '/signup' do
  erb :signup
end

# POST /signup

post '/signup' do
  @username = params[:username]
  @password = params[:password]
  @verify = params[:verify]
  @email = params[:email]
  have_error = false
  unless valid_username(@username)
    @error_username = "That's not a valid username."
    have_error = true
  end
  if not valid_password(@password)
    @error_password = "That wasn't a valid password."
    have_error = true
  elsif @verify != @password
    @error_verify = "Your passwords didn't match."
    have_error = true
  end
  if @email =~ /^.+$/ and not valid_email(@email)
    @error_email = "That's not a valid email."
    have_error = true
  end
  unless have_error
    redirect "/welcome?username=#{@username}"
  end
  erb :signup
end

# GET /welcome

get '/welcome' do
  unless valid_username(params[:username])
    redirect '/signup'
  end
  erb :welcome
end

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end

