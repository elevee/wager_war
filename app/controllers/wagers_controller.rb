class WagersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @open_wagers = Wager.where('host_id' == current_user)
  end

  def create
    # Create new wager from params
    @wager = Wager.new(params[:wager])
      # Assign current user 
      @wager.host_id = current_user.id
      # Assign guest user

    if @wager.valid? 
      respond_to do |format|
        if @wager.save
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
  end

  def show
    @wager = Wager.find(params[:id])
  end

  def edit
    @wager = Wager.find(params[:id])
  end 

  def update
    @wager = Wager.find(params[:id])
    if @wager.update_attributes(params[:wager])
      redirect_to wager_path
    else
      render :action => :edit
    end
  end

  def destroy
  end

end
