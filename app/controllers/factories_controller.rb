class FactoriesController < ApplicationController
  before_filter :factory
  before_filter :commercial, :only => [ :create, :destroy, :edit, :new, :update ]

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
    @factory = Factory.find(params[:id])
    if @factory.orders.count == 0
      @factory.destroy
      flash[:success] = "Factory deleted!"
      redirect_to factories_path
    else
      flash[:error] = "Factory can't be deleted, there are orders related to this factory"
      redirect_to factories_path
    end
  end

end
