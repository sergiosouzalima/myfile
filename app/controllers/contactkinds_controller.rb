class ContactkindsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :js
    
  def index
    @contactkinds = Contactkind.accessible_by(current_ability).
                    paginate(:per_page => 15, :page => params[:page])    
    respond_with @contactkinds                     
  end

  def show
    @contactkind = Contactkind.find(params[:id])
    respond_with @contactkind
  end

  def new
    @contactkind = Contactkind.new
    respond_with @contactkind
  end

  def edit
    @contactkind = Contactkind.find(params[:id])
  end

  def create
    @contactkind = Contactkind.new(params[:contactkind])
    @contactkind.user_id = current_user.id
    
    if @contactkind.save
      flash[:notice] =  Contactkind.model_name.human.titleize + ' criado com sucesso.'
      respond_with @contactkind
    else
      render :action => :new 
    end    
  end

  def update
    @contactkind = Contactkind.find(params[:id])
    
    if @contactkind.update_attributes params[:contactkind]
      flash[:notice] = Contactkind.model_name.human.titleize + ' alterado com sucesso.'
      respond_with @contactkind
    else
      render :action => :edit
    end    
  end

  def destroy
    @contactkind = Contactkind.find(params[:id])
    @contactkind.destroy
    respond_with @contactkind
  end
end