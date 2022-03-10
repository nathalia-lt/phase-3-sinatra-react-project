class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "Enter your name; Start playing"
  end

  get '/game' do
    "Hello Game"
  end

  get '/getHighScores' do
    top_three_scores = Score.top_three_scores
    top_three_scores.to_json
  end

  get ‘/test’ do
    Score.player_scores
  end
  
  #BASIC routes
  get ‘/player’ do
    player = Player.all
    player.to_json
  end

  get ‘/scores’ do
    score = Score.all
    score.to_json
  end

  #ID routes
  get ‘/player’ do
    Player.find(params[:id]).to_json
  end

  get ‘/scores’ do
    Scores.finc(params[:id]).to_json
  end

  #DELETE ALL
  delete ‘/scores/:id’ do
    scores = Scores.find(params[:id])
    scores.destroy
    scores.to_json
  end

  #POST
  post ‘/player’ do
    player = Player.create(
      player_name: params[:player_name],
      scores: params[:scores]
    )
    game.to_json
  end

  post ‘/score’ do
    scores = Scores.create(
      scores: params[:scores]
    )
    game.to_json
  end

end
