require 'sinatra'

get '/' do
  @links = ['rot13']
  erb :index
end

get '/rot13' do
  @text = ''
  erb :rot13
end

post '/rot13' do
  @text = rot13(params[:text])
  erb :rot13
end

def rot13(s)
  s.tr("A-MN-Za-mn-z", "N-ZA-Mn-za-m")
end

