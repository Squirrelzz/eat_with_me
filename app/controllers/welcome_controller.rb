class WelcomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @person = current_user.people.first
    redirect_to person_path(@person)
  end
end
