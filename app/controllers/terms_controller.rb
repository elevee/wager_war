class TermsController < ApplicationController

  def index
    
  end

  def create
    Term.create(params[:wager][:term])
  end

  def new
    @terms = Term.new
  end

  def update
  end 

  def destroy
  end

end
