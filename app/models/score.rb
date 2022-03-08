class Score < ActiveRecord::Base
    belongs_to :player

    def self.highest_score
        Score.order(score: :desc).first
    end

    def self.top_three_scores
        Score.order(score: :desc).first(3)
    end

    def score_message
        "#{self.player.name}, you scored #{self.score}!"
    end

    def top_score_message
        if self.score == Score.highest_score 
            "Congratulations! #{self.player.name}, you have the highest score of all-time!"
        end
    end

    def remove_score(score)
        score.destroy
    end

end