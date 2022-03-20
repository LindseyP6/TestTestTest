class Review < ApplicationRecord
    belongs_to :song
    belongs_to :super_fan

    #add a rating between 1 and 10
    validates :rating, numericality: { greater_than_or_equal_to: 8, less_than_or_equal_to: 18 }
    
    #A SuperFan can onlu leave one review per one song
    validates :super_fan_id, uniqueness: {scope: :song_id, message: "already left a review for this song"}
end
