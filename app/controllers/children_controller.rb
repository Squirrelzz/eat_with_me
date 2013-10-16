class ChildrenController < ApplicationController
  respond_to :html

  before_filter :find_child, only: :show

  def journal
    @parent = User.find(params[:parent_id])
    @child = User.find(params[:child_id])

    respond_with @parent
  end

  def show
    if @child.has_pet?
      redirect_to pet_path(@child.pet)
    else
      respond_with @child
    end
  end

  private

  def find_child
    @child = User.find(params[:id])
  end
end
