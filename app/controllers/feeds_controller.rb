class FeedsController < ApplicationController
  respond_to :html

  before_filter :find_feed, only: :show

  def create
    @feed = Feed.new(params.require(:feed).permit(:pet_id, :meal_id))

    if @feed.save
      respond_with @feed
    end
  end

  private

  def find_feed
    @feed = Feed.find(params[:id])
  end
end
