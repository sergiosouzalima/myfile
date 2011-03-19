class OrganizationsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :js
   
  def index
    @organizations = Organization.accessible_by(current_ability).
                 paginate(:per_page => 5, :page => params[:page])  
    respond_with @organizations               
  end

  def show
    @organization = Organization.find(params[:id])
    respond_with @organization
  end

  def new
    @organization = Organization.new
    respond_with @organization
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def create
    @organization = Organization.new(params[:organization])
    @organization.user_id = current_user.id  
    
    if @organization.save
      flash[:notice] =  Organization.model_name.human.titleize + ' criado com sucesso.'
      respond_with @organization
    else
      render :action => :new 
    end
  end

  def update
    @organization = Organization.find(params[:id])

    if @organization.update_attributes params[:organization]
      flash[:notice] = Organization.model_name.human.titleize + ' alterado com sucesso.'
      respond_with @organization
    else
      render :action => :edit
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    respond_with @organization
  end
end
