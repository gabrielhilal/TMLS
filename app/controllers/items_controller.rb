class ItemsController < ApplicationController
  before_filter :factory

  def new
    @title = "New Item"
    @order = Order.find(params[:order_id])
    @drop = @order.drops.find(params[:drop_id])
    @item = @drop.items.build
  end

  def create
    @order = Order.find(params[:order_id])
    @drop = @order.drops.find(params[:drop_id])
    @item = @drop.items.build(params[:item])
    @order.edited = current_user.name
    @order.edited_date = Time.now
    @order.save
    if @item.save
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
    @item = @drop.items.find(params[:id])
  end

  def update
    @order = Order.find(params[:order_id])
    @drop = @order.drops.find(params[:drop_id])
    @item = Item.find(params[:id])
    @order.edited = current_user.name
    @order.edited_date = Time.now
    @order.save
    if @item.update_attributes(params[:item])
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
    if @drop.invoice
      flash[:error] = "Item can't be deleted, invoice has been raised"
      redirect_to order_path(@order)
    elsif @drop.invoice.nil?
      Item.find(params[:id]).destroy
      flash[:success] = "Item deleted!"
      redirect_to order_path(@order)
    else
      flash[:error] = "Item can't be deleted, there is an invoice related to this item"
      redirect_to order_path(@order)
    end
  end

end
