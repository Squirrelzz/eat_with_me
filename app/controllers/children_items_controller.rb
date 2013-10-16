class ChildrenItemsController < ApplicationController
  respond_to :json

  def create
    @children_item = ChildrenItem.new(children_item_params)

    if @children_item.save
      respond_to do |format|
        format.json do
          render json: {
            item_id: @children_item.item_id,
            user_id: @children_item.user_id,
            item_name: @children_item.item_name.titleize
          }.to_json
        end
      end
    end
  end

  private

  def children_item_params
    params.require(:children_item).permit(:user_id, :item_id)
  end
end
