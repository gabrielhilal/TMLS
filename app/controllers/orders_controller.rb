class OrdersController < ApplicationController
  before_filter :factory, :only => [ :create, :destroy, :edit, :new, :update ]
  def index
    @title = "Orders"
    if current_user.department == "Factory"
      factory = current_user.factory
      @orders = factory.orders
      @orders = @orders.search(params[:search])
    else
      @orders = Order.search(params[:search])
    end
  end

  def new
    @title = "New Order"
    @order = Order.new
    @order.returns ||= "0"
    @order.finance ||= "1"
  end

  def create
    @order = Order.new(params[:order])
    @order.acknowledgement = 0
    @order.edited = current_user.name
    @order.edited_date = Time.now
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
    @order.edited = current_user.name
    @order.edited_date = Time.now
    @order.acknowledgement = 0
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
    @title = "PO "+ @order.number
    @drops = @order.drops.all
    unless @order.factory == current_user.factory
      unless current_user.department != "Factory"
        flash[:error] = "Authorisation is required to access this content."
        redirect_to orders_path
      end
    end
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

  def acknow
    @order = Order.find(params[:id])
    @order.acknowledgement=1
    @order.acknowledgementdate= Time.now
      if @order.update_attributes(params[:order])
        flash[:success] = "Order acknowledged"
        redirect_to order_path(@order)
      end
  end

  def requestacknow
    @order = Order.find(params[:id])
    @order.acknowledgement=0
    @order.acknowledgementdate= Time.now
      if @order.update_attributes(params[:order])
        flash[:success] = "Acknowledgement requested"
        redirect_to order_path(@order)
      end
  end
end
