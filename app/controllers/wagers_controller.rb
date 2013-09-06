class WagersController < ApplicationController

  def index
    
  end

  def create
    @wager = Wager.create(params[:wager])
  end

  def new
    @wager = Wager.new
    @terms = Term.new
  end

  def update
  end 

  def destroy
  end

end
