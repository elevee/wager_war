class WagersController < ApplicationController

before_filter :authenticate_user!

  def index
    
  end

  def create
    # Assign current user and guest user to wager and create it so it has an ID
    @wager = Wager.new(params[:wager])
      @wager.host_id = current_user.id
      # still need to assign guest user id
    if @wager.save  
      # Create terms
      @term = []
      @term.push(Term.create(params[:term]))
      binding.pry
      # Add terms to existing wager
      @wager.terms.each do |term|
        # @wager.host_terms.push(term.id)
      end
      redirect_to :action => 'show'
    else
      render :action => 'new'
    end

    # params[:term].each
    # @term = @wager.terms.build(params[:term])
    # @term.save

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
