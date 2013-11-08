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

    @term = @wager.terms.build(params[:term])

    if @wager.valid? 
      respond_to do |format|
        if @wager.save
          last_term = @wager.terms.last
          if last_term.host_criterion == nil && last_term.guest_criterion == nil
            last_term.destroy
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
    @host_terms = @wager.terms.select do |term|
      unless term.host_criterion.nil?
        term
      end
    end

    @guest_terms = @wager.terms.select do |term|
      unless term.guest_criterion.nil?
        term
      end
    end
  end

  def edit
    @wager = Wager.find(params[:id])
    
  end 

  def update
    # @post = Post.find params[:id]
    # if @post.update_attributes params[:post]
    #   redirect_to posts_path
    # else
    #   render :action => :edit
    # end
  end

  def destroy
  end

end
