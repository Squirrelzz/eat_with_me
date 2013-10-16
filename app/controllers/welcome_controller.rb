class WelcomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    if @user.is_parent?
      redirect_to parent_path(@user)
    elsif @user.is_child?
      redirect_to child_path(@user)
    else
      raise "WTF?"
    end
  end
end
