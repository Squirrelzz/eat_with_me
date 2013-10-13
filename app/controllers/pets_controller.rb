class PetsController < ApplicationController

  before_filter :find_pet, only: [:show, :reset]

  respond_to :html, :json

  def create
    pet_attributes = params[:pet]
    pet = Pet.new do |p|
      p.name = pet_attributes[:name]
      p.sex = pet_attributes[:sex]
      p.character_id = pet_attributes[:character_id]
      p.person_id = pet_attributes[:person_id]
    end

    if pet.save
      redirect_to pet_path(pet)
    end
  end

  def show
    respond_with @pet
  end

  def reset
    @pet.feeds = []
    redirect_to pet_path(@pet)
  end

  private

  def find_pet
    @pet = Pet.find(params[:id] || params[:pet_id])
  end
end
