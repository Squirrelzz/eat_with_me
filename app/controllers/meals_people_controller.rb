class MealsPeopleController < ApplicationController
  respond_to :json

  def create
    @meals_person = MealsPerson.new(params.require(:meals_person).permit(:person_id, :meal_id))
    if @meals_person.save
      respond_to do |format|
        format.json do
          render json: @meals_person.to_json
        end
      end
    end
  end
end
