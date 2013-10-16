class PetsController < ApplicationController
  before_filter :find_pet, only: [:show, :reset]

  respond_to :html, :json

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to pet_path(@pet)
    end
  end

  def show
    respond_with @pet
  end

  def reset
    @pet.items_pets = []
    redirect_to pet_path(@pet)
  end

  private

  def find_pet
    @pet = Pet.find(params[:id] || params[:pet_id])
  end

  def pet_params
    params.require(:pet).permit(:name, :sex, :character_id, :user_id)
  end
end
