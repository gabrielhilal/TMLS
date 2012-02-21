class OrdersController < ApplicationController
  def index
    @title = "Orders"
    @orders = Order.all
  end

  def new
    @title = "New Order"
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:success] = "Order " + @order.number + " created!"
      redirect_to @order
    else
      @title = "New Order"
      render 'new'
    end
  end

  def edit
    @title = "Edit Order"
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      flash[:success] = "Order details updated!"
      redirect_to order_path
    else
      @title = "Edit Order"
      render 'edit'
    end
  end

  def show
    @order = Order.find(params[:id])
    @drops = @order.drops.all
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.drops.count == 0
      @order.destroy
      flash[:success] = "Order deleted!"
      redirect_to orders_path
    else
      flash[:error] = "Order can't be deleted, there are drops related to this order"
      redirect_to order_path
    end
  end

end
