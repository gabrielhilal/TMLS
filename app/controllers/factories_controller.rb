class FactoriesController < ApplicationController

  def index
    @title = "Factories"
    @factories = Factory.all
  end

  def new
    @title = "New Factory"
    @factory = Factory.new
  end

  def create
    @factory=Factory.new(params[:factory])
    if @factory.save
      flash[:success] = "Factory " + @factory.name + " created!"
      redirect_to factories_path
    else
      @title = "New Factory"
      render 'new'
    end
  end


  def edit
    @title = "Edit Factory"
    @factory = Factory.find(params[:id])
  end

  def update
    @factory = Factory.find(params[:id])
    if @factory.update_attributes(params[:factory])
      flash[:success] = "Factory details updated!"
      redirect_to factories_path
    else
      @title = "Edit Factory"
      render 'edit'
    end
  end

  def destroy
    Factory.find(params[:id]).destroy
    flash[:success] = "Factory deleted!"
    redirect_to factories_path
  end

end
