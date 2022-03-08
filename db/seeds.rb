puts "Clearing old data..."
Player.destroy_all
Score.destroy_all

puts "Seeding players..."
players = ["Alan", "Nathalia", "Jonathan", "Olga", "Scarlett", "Mike", "Steve", "Harris", "Dianna", "Patrick", "Lynden", "Michael", "Alison", "Dan", "Francis", "Henry", "Kevin", "Al"]
# Create sample players
players.each do |player|
  Player.create(name: player)
end

puts "Seeding scores..."
# Create 60 random Scores
60.times do
    player_id = Player.ids.sample
    Score.create(score: rand(1..50), created_at: (1..6000).to_a.sample.minutes.ago, player_id: player_id)
end

puts "✅ Done seeding!"
