class WagersController < ApplicationController

  before_filter :authenticate_user!

  def index
    
  end

  def create
    # Create new wager from params
    @wager = Wager.new(params[:wager])
      # Assign current user 
      @wager.host_id = current_user.id
      # Assign guest user

    @term = @wager.terms.build(params[:term])

    if @wager.valid? 
      respond_to do |format|
        if @wager.save

          binding.pry

          format.html { redirect_to(@wager, :notice => 'Wager Stub successfully created.') }
          format.xml  { render :xml => @wager, :status => :created, :location => @wager }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @wager.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def new
    @wager = Wager.new
    @term = Term.new
    3.times { @wager.terms.build }
  end

  def show
    @wager = Wager.find(params[:id])
  end

  def update
  end 

  def destroy
  end

end
