class FilekindsController < ApplicationController
  before_filter :authenticate_user!
    
  # GET /filekinds
  # GET /filekinds.xml
  def index
    #@filekinds = Filekind.paginate :page => params[:page], :per_page => 5
    @filekinds = Filekind.search(params[:search]).
                   paginate(:per_page => 5, :page => params[:page])  
    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.xml  { render :xml => @filekinds }
    #end
  end

  # GET /filekinds/1
  # GET /filekinds/1.xml
  def show
    @filekind = Filekind.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @filekind }
    end
  end

  # GET /filekinds/new
  # GET /filekinds/new.xml
  def new
    @filekind = Filekind.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @filekind }
    end
  end

  # GET /filekinds/1/edit
  def edit
    @filekind = Filekind.find(params[:id])
  end

  # POST /filekinds
  # POST /filekinds.xml
  def create
    @filekind = Filekind.new(params[:filekind])

    respond_to do |format|
      if @filekind.save
        format.html { redirect_to(@filekind, :notice => 'Filekind was successfully created.') }
        format.xml  { render :xml => @filekind, :status => :created, :location => @filekind }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @filekind.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /filekinds/1
  # PUT /filekinds/1.xml
  def update
    @filekind = Filekind.find(params[:id])

    respond_to do |format|
      if @filekind.update_attributes(params[:filekind])
        format.html { redirect_to(@filekind, :notice => 'Filekind was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @filekind.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /filekinds/1
  # DELETE /filekinds/1.xml
  def destroy
    @filekind = Filekind.find(params[:id])
    @filekind.destroy

    respond_to do |format|
      format.html { redirect_to(filekinds_url) }
      format.xml  { head :ok }
    end
  end
end
