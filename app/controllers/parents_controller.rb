class ParentsController < ApplicationController
  respond_to :html

  before_filter :find_parent

  def show
    respond_with @parent
  end

  private

  def find_parent
    @parent = User.find(params[:id])
  end
end
