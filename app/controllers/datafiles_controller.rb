class DatafilesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :js
    
  def index
    session[:previous_search] = params[:search] if params[:search]
    params[:search] = session[:previous_search]
    @datafiles = Datafile.search( params, current_ability )
    respond_with @datafiles                     
  end

  def show
    @datafile = Datafile.find(params[:id])
    render :action => :edit
    #@datafile = Datafile.find(params[:id])
    #respond_with @datafile
  end

  def new
    @datafile = Datafile.new
    2.times do
      local = @datafile.locals.build
      3.times { local.contacts.build }
    end
    respond_with @datafile
  end

  def edit
    #@edit_show = :edit
    @datafile = Datafile.find(params[:id])
    @datafile.locals.map do |q|
      3.times { q.contacts.build }
    end
    2.times do  
      local = @datafile.locals.build  
      3.times { local.contacts.build }  
    end 
  end

  def create
    @datafile = Datafile.new(params[:datafile])
    @datafile.user_id = current_user.id
    
    if @datafile.save
      flash[:notice] =  Datafile.model_name.human.titleize + ' criado com sucesso.'
      respond_with @datafile
    else
      1.times { @datafile.locals.build }
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
