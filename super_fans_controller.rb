class SuperFansController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        fans = SuperFan.all
        render json: fans
    end

    def destroy
        fan = SuperFan.find(params[:id])
        fan.destroy
        head :no_content
   end

   private

   def render_not_found_response(error)
        render json: {errors: "#{error.model} Not Found"}, status: :not_found
    end

end
