class Player < ActiveRecord::Base
    has_many :scores

    def remove_player_scores
        self.scores.each do |score|
            score.delete
        end
    end

    def player_scores
        Player.all.map do | name |
            name 
        end
    end

end