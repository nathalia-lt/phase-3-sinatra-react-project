class Score < ActiveRecord::Base
    belongs_to :player

    def self.highest_score
        Score.order(score: :desc).first
    end

    def self.top_three_scores
        Score.order(score: :desc).first(3)
    end

    def self.top_three_scores_details
        Score.order(score: :desc).first(3)
    end

    def self.player_scores
        Score.pl
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

    def self.player_scores
        player_scores = [] 
        Score.all.each do |score|
            player_scores << {
                player_name: score.player.name,
                player_score: score.score
            }
        end
        player_scores.sort_by{ |k| k[:player_score]}.reverse.to_json
    end

end