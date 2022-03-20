class ReviewsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

    def create
        review = Review.create!(review_params)
        render json: review.song, status: :ok
    end

    private

    def review_params
        params.permit(:song_id, :super_fan_id, :comment, :rating)
    end 

    def unprocessable_entity(invalid)
        render json: {error: invalid.message}, status: :unprocessable_entity       
    end
end


