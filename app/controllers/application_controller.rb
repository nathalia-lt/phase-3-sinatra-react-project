class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "Enter your name; Start playing"
  end

  get '/game' do
    "Hello Game"
  end

  get '/scores' do
    "Hello Scores"
  end

end
