class SongsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    #GET /songs
    def index
        songs = Song.all
        render json: songs
    end

    #GET /songs/:id
    def show
        song = Song.find(params[:id])
        render json: song, serializer: SongReviewSerializer, status: :ok
    end

    private

    def render_not_found_response(error)
        render json: {errors: "#{error.model} Not Found"}, status: :not_found
    end

    # def render_not_found_response(exception)
    #     render json: { errors: exception.message }, status: :not_found
    # end
    
end
