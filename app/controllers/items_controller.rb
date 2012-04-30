class ItemsController < ApplicationController
  before_filter :factory

  def new
    @title = "New Item"
    @order = Order.find(params[:order_id])
    @drop = @order.drops.find(params[:drop_id])
    if @drop.invoice
      flash[:error] = "Item can't be created, invoice has been raised"
      redirect_to order_path(@order)
    else @drop.invoice.nil?
      @item = @drop.items.build
    end
  end

  def create
    @order = Order.find(params[:order_id])
    @drop = @order.drops.find(params[:drop_id])
    @item = @drop.items.build(params[:item])
    if @item.save
      @order.acknowledgement=0
      @order.edited = current_user.name
      @order.edited_date = Time.now
      @order.save
      flash[:success] = "Item created!"
      redirect_to order_path(@order)
    else
      @title = "New Item"
      render 'new'
    end
  end

  def edit
    @title = "Edit Item"
    @order = Order.find(params[:order_id])
    @drop = @order.drops.find(params[:drop_id])
    if @drop.invoice
      flash[:error] = "Item can't be edited, invoice has been raised"
      redirect_to order_path(@order)
    else @drop.invoice.nil?
      @item = @drop.items.find(params[:id])
    end
  end

  def update
    @order = Order.find(params[:order_id])
    @drop = @order.drops.find(params[:drop_id])
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      @order.acknowledgement=0
      @order.edited = current_user.name
      @order.edited_date = Time.now
      @order.save
      flash[:success] = "Item details updated!"
      redirect_to order_path(@order)
    else
      @title = "Edit Item"
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:order_id])
    @drop = @order.drops.find(params[:drop_id])
    if @drop.invoice.nil?
      @order.acknowledgement=0
      @order.edited = current_user.name
      @order.edited_date = Time.now
      @order.save
      Item.find(params[:id]).destroy
      flash[:success] = "Item deleted!"
      redirect_to order_path(@order)
    else
      flash[:error] = "Item can't be deleted, invoice has been raised"
      redirect_to order_path(@order)
    end
  end

end
