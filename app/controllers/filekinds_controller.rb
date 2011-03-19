class FilekindsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :js
    
  def index
    @filekinds = Filekind.accessible_by(current_ability).search(params[:search]).
                 paginate(:per_page => 5, :page => params[:page])    
    respond_with @filekinds                     
  end

  def show
    @filekind = Filekind.find(params[:id])
    respond_with @filekind
  end

  def new
    @filekind = Filekind.new
    respond_with @filekind
  end

  def edit
    @filekind = Filekind.find(params[:id])
  end

  def create
    @filekind = Filekind.new(params[:filekind])
    @filekind.user_id = current_user.id
    
    if @filekind.save
      flash[:notice] =  Filekind.model_name.human.titleize + ' criado com sucesso.'
      respond_with @filekind
    else
      render :action => :new 
    end    
  end

  def update
    @filekind = Filekind.find(params[:id])
    
    if @filekind.update_attributes params[:filekind]
      flash[:notice] = Filekind.model_name.human.titleize + ' alterado com sucesso.'
      respond_with @filekind
    else
      render :action => :edit
    end    
  end

  def destroy
    @filekind = Filekind.find(params[:id])
    @filekind.destroy
    respond_with @filekind
  end
end
