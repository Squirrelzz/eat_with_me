class FeedsController < ApplicationController

  respond_to :html, :json

  def create
    @feed = Feed.new(params.require(:feed).permit(:pet_id, :meal_id))

    if @feed.save
      respond_to do |format|
        format.html { @feed }
        format.json {
          render json: {
            meal_id: @feed.meal_id,
            pet_id: @feed.pet_id,
            meal_name: @feed.meal_name.titleize,
            health_index: @feed.pet_health_index,
            health_icon: @feed.pet_health_icon,
            coins: @feed.pet_coins
          }.to_json
        }
      end
    end
  end
end
