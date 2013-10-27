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

    @term = @wager.terms.build(params[:terms])

    #   # Create terms
    #   @host_terms = params[:wager][:terms_attributes]
    #   @guest_terms = 

    #   @term = []
    #   @term.push(Term.create(params[:term]))
    #   binding.pry
    #   # Add terms to existing wager
    #   @wager.terms.each do |term|
    #     # @wager.host_terms.push(term.id)
    #   end
    #   redirect_to :action => 'show'
    # else
    #   render :action => 'new'
    # end

    # params[:term].each
    # @term = @wager.terms.build(params[:term])
    # @term.save

    if @wager.valid? 
      respond_to do |format|
        if @wager.save

          terms_array = params["wager"]["terms_attributes"].values
          host_terms = []
          guest_terms = []

          terms_array.each do |term|
            x = term["host_criterion"]
            if x
              host_terms.push(x)
            end
          end
          
          terms_array.each do |term|
            y = term["guest_criterion"]
            if y
              guest_terms.push(y)
            end
          end

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
