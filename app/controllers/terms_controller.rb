class TermsController < ApplicationController

  before_filter :get_wager

  def index
    
  end

  def create
    @term = @wager.terms.build(params[:terms])
    respond_to do |format|
      if @term.save
        format.html { redirect_to wager_url(@wager), notice: 'Term was successfully created.'}
        format.json { render json: @term, status: :created, location: @term }
      else
        format.html { render action: "new" }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @term = @wager.terms.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @term }
  end

  def update
  end 

  def destroy
  end

  private
  
    # get_wager gets wager_id and turns it into a @term object  
    def get_wager
      @wager = Wager.find(params[:id])
    end

end
