class OccupationsController < ApplicationController
   before_filter :authenticate_user!
   
  # GET /occupations
  # GET /occupations.xml
  def index
    @occupations = Occupation.accessible_by(current_ability).search(params[:search]).
                 paginate(:per_page => 5, :page => params[:page])  
  end

  # GET /occupations/1
  # GET /occupations/1.xml
  def show
    @occupation = Occupation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @occupation }
    end
  end

  # GET /occupations/new
  # GET /occupations/new.xml
  def new
    @occupation = Occupation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @occupation }
    end
  end

  # GET /occupations/1/edit
  def edit
    @occupation = Occupation.find(params[:id])
  end

  # POST /occupations
  # POST /occupations.xml
  def create
    @occupation = Occupation.new(params[:occupation])
    @occupation.user_id = current_user.id  

    respond_to do |format|
      if @occupation.save
        format.html { redirect_to(@occupation, :notice => 'Occupation was successfully created.') }
        format.xml  { render :xml => @occupation, :status => :created, :location => @occupation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @occupation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /occupations/1
  # PUT /occupations/1.xml
  def update
    @occupation = Occupation.find(params[:id])

    respond_to do |format|
      if @occupation.update_attributes(params[:occupation])
        format.html { redirect_to(@occupation, :notice => 'Occupation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @occupation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /occupations/1
  # DELETE /occupations/1.xml
  def destroy
    @occupation = Occupation.find(params[:id])
    @occupation.destroy

    respond_to do |format|
      format.html { redirect_to(occupations_url) }
      format.xml  { head :ok }
    end
  end
end
