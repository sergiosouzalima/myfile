class OccupationsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :js
   
  def index
    @occupations = Occupation.accessible_by(current_ability).
                 paginate(:per_page => 5, :page => params[:page])  
    respond_with @occupations               
  end

  def show
    @occupation = Occupation.find(params[:id])
    respond_with @occupation
  end

  def new
    @occupation = Occupation.new
    respond_with @occupation
  end

  def edit
    @occupation = Occupation.find(params[:id])
  end

  def create
    @occupation = Occupation.new(params[:occupation])
    @occupation.user_id = current_user.id  
    
    if @occupation.save
      flash[:notice] =  Occupation.model_name.human.titleize + ' criado com sucesso.'
      respond_with @occupation
    else
      render :action => :new 
    end
  end

  def update
    @occupation = Occupation.find(params[:id])

    if @occupation.update_attributes params[:occupation]
      flash[:notice] = Occupation.model_name.human.titleize + ' alterado com sucesso.'
      respond_with @occupation
    else
      render :action => :edit
    end
  end

  def destroy
    @occupation = Occupation.find(params[:id])
    @occupation.destroy
    respond_with @occupation
  end
end
