class ReportsController < ApplicationController
  before_filter :factory
  before_filter :commercial
  def index
    if  params[:currency] == ''
      flash[:error]= 'Please select the currency for report'
      redirect_to reports_index_path
    else
      @customer = Customer.where(:id => params[:customer])
      @factory = Factory.where(:id => params[:factory])
      @cur = params[:currency]

      if params[:customer] == "Select Customer" and params[:factory] == "Select Factory"
        @orders = Order.where(:currency => params[:currency])
      elsif params[:factory] == "Select Factory"
        @orders = Order.where(:customer_id => @customer, :currency => params[:currency])
      elsif params[:customer] == "Select Customer"
        @orders = Order.where(:factory_id => @factory, :currency => params[:currency])
      else
        @orders = Order.where(:currency => params[:currency])
        @orders = Order.where("customer_id = ? AND factory_id = ?", @customer, @factory)
      end

      if params[:status] == "shipped"
        @temp=[]
        Order.all.each  do |order|
         if order.status(order) == 'Shipped'
        @temp = @temp << order
         end
        end
        @orders = @orders & @temp

      elsif params[:status] == "part_shipped"
        @temp=[]
        Order.all.each  do |order|
         if order.status(order) == 'Part Shipped'
        @temp = @temp << order
         end
        end
        @orders = @orders & @temp

      elsif params[:status] == "in_production"
        @temp=[]
        Order.all.each  do |order|
         if order.status(order) == 'In Production'
        @temp = @temp << order
         end
        end
        @orders = @orders & @temp

      end

      @drops = Drop.where(:order_id => @orders)

      if params[:payment] == "paid"
        @temp=[]
        Invoice.all.each do |invoice|
        if invoice.paid == true
          @temp << invoice.drop
        end
        end
        @drops = @drops & @temp
      elsif params[:payment] == "unpaid"
        @temp=[]
        Invoice.all.each do |invoice|
        if invoice.paid == false
          @temp << invoice.drop
        end
        end
        @drops = @drops & @temp
      end
    end
  end
end
