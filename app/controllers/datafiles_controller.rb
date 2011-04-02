class DatafilesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :js
    
  def index
    @datafiles = Datafile.accessible_by(current_ability).search(params[:search]).
                 paginate(:per_page => 15, :page => params[:page])    
    respond_with @datafiles                     
  end

  def show
    @datafile = Datafile.find(params[:id])
    respond_with @datafile
  end

  def new
    @datafile = Datafile.new
    respond_with @datafile
  end

  def edit
    @datafile = Datafile.find(params[:id])
  end

  def create
    @datafile = Datafile.new(params[:datafile])
    @datafile.user_id = current_user.id
    
    if @datafile.save
      flash[:notice] =  Datafile.model_name.human.titleize + ' criado com sucesso.'
      respond_with @datafile
    else
      render :action => :new 
    end    
  end

  def update
    @datafile = Datafile.find(params[:id])
    
    if @datafile.update_attributes params[:datafile]
      flash[:notice] = Datafile.model_name.human.titleize + ' alterado com sucesso.'
      respond_with @datafile
    else
      render :action => :edit
    end    
  end

  def destroy
    @datafile = Datafile.find(params[:id])
    @datafile.destroy
    respond_with @datafile
  end
end
