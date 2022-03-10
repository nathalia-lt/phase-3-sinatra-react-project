class Player < ActiveRecord::Base
    has_many :scores

    def get_player_name
        self.name
    end

    def remove_player_scores
        self.scores.each do |score|
            score.delete
        end
    end
end