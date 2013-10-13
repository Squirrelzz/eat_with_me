class FeedsController < ApplicationController

  respond_to :html, :json

  before_filter :find_feed, only: :show

  def create
    @feed = Feed.new(params.require(:feed).permit(:pet_id, :meal_id))

    if @feed.save
      respond_to do |format|
        format.html { @feed }
        format.json {
          render json: {
            meal_id: @feed.meal_id,
            pet_id: @feed.pet_id,
            health_index: @feed.pet.health_index,
            health_icon: @feed.pet.health_icon,
            coins: @feed.pet.coins
          }.to_json
        }
      end
    end
  end

  private

  def find_feed
    @feed = Feed.find(params[:id])
  end
end
