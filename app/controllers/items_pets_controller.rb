class ItemsPetsController < ApplicationController
  respond_to :html, :json

  def create
    @items_pet = ItemsPet.new(items_pet_params)

    if @items_pet.save
      respond_to do |format|
        format.html { @items_pet }
        format.json {
          render json: {
            how_healthy:      how_healthy,
            children_item_id: @items_pet.children_item_id,
            coins:            @items_pet.pet_coins,
            feeling:          @items_pet.pet_feeling,
            happiness:        @items_pet.happiness,
            health_icon:      @items_pet.pet_health_icon,
            health_index:     @items_pet.pet_health_index,
            item_id:          @items_pet.item.id,
            item_name:        @items_pet.item_name.titleize,
            pet_id:           @items_pet.pet_id,
            pet_image:        @items_pet.pet.pet_image,
            value:            @items_pet.item_points,
          }.to_json
        }
      end
    end
  end

  private

  def how_healthy
    q = @items_pet.item_qualification

    case q
    when 'a-good'
      "Healthy"
    when 'b-neutral'
      "A little healthy"
    when 'c-bad'
      "Very Very Bad."
    end
  end

  def items_pet_params
    params.require(:items_pet).permit(:pet_id, :children_item_id)
  end
end
