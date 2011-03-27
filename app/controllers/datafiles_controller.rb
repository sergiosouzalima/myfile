class DatafilesController < ApplicationController
  before_filter :authenticate_user!	
  
  # GET /datafiles
  # GET /datafiles.xml
  def index
    #@datafiles = Datafile.all
    @datafiles = Datafile.accessible_by(current_ability).search(params[:search]).
                   paginate(:per_page => 5, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datafiles }
    end
  end

  # GET /datafiles/1
  # GET /datafiles/1.xml
  def show
    @datafile = Datafile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @datafile }
    end
  end

  # GET /datafiles/new
  # GET /datafiles/new.xml
  def new
    @datafile = Datafile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @datafile }
    end
  end

  # GET /datafiles/1/edit
  def edit
    @datafile = Datafile.find(params[:id])
  end

  # POST /datafiles
  # POST /datafiles.xml
  def create
    @datafile = Datafile.new(params[:datafile])
    @datafile.user_id = current_user.id
    
    respond_to do |format|
      if @datafile.save
        format.html { redirect_to(@datafile, :notice => 'Datafile was successfully created.') }
        format.xml  { render :xml => @datafile, :status => :created, :location => @datafile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @datafile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datafiles/1
  # PUT /datafiles/1.xml
  def update
    @datafile = Datafile.find(params[:id])

    respond_to do |format|
      if @datafile.update_attributes(params[:datafile])
        format.html { redirect_to(@datafile, :notice => 'Datafile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @datafile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datafiles/1
  # DELETE /datafiles/1.xml
  def destroy
    @datafile = Datafile.find(params[:id])
    @datafile.destroy

    respond_to do |format|
      format.html { redirect_to(datafiles_url) }
      format.xml  { head :ok }
    end
  end
end
