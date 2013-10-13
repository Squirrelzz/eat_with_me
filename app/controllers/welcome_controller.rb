class WelcomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @person = current_user.people.first

    if @person.present?
      if @person.pets.any?
        redirect_to pet_path(@person.pets.first)
      else
        redirect_to person_path(@person)
      end
    end
  end
end
