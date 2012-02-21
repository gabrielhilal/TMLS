class DropsController < ApplicationController

  def new
    @title = "New Drop"
    @order = Order.find(params[:order_id])
    @drop = @order.drops.build
  end

  def create
    @order = Order.find(params[:order_id])
    @drop = @order.drops.build(params[:drop])
    if @drop.save
      flash[:success] = "Drop created!"
      redirect_to order_path(@order)
    else
      @title = "New Drop"
      render 'new'
    end
  end

  def edit
    @title = "Edit Drop"
    @order = Order.find(params[:order_id])
    @drop = @order.drops.find(params[:id])
  end

  def show
  end

  def update
    @order = Order.find(params[:order_id])
    @drop = Drop.find(params[:id])
    if @drop.update_attributes(params[:drop])
      flash[:success] = "Drop details updated!"
      redirect_to order_path(@order)
    else
      @title = "Edit Drop"
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:order_id])
    @drop = @order.drops.find(params[:id])
    if @drop.items.count == 0
      @drop.destroy
      flash[:success] = "Drop deleted!"
      redirect_to order_path(@order)
    else
      flash[:error] = "Drop can't be deleted, there are items related to this drop"
      redirect_to order_path(@order)
    end
  end
end
