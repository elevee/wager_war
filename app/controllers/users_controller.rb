class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def new
  end

  def create
    @user = current_user
  end
end
