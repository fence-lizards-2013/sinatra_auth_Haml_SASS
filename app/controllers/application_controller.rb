require 'sass'

get '/css/application.css' do
  scss :application
end

get '/' do
  # Look in app/views/index.haml
  haml :index
end
