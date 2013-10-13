class PeopleController < ApplicationController
  before_filter :find_person

  respond_to :html

  def show
    respond_with @person
  end

  private

  def find_person
    @person = Person.find(params[:id])
  end
end
