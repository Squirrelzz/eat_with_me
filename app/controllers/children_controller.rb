class ChildrenController < ApplicationController

  before_filter :find_user, :find_child

  def menu
  end

  def journal
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_child
    @child = Person.find(params[:child_id])
  end
end
