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

      @drops = Drop.where(:order_id => @orders)

      #if params[:status] == "shipped"
      #  @orders = @orders.map do |i| i.status(i)== 'Shipped' end
      #elsif params[:status] == "part_shipped"
      #  @orders = @orders.map do |i| if i.status(i) == 'Part Shipped'; end end
      #elsif params[:status] == "in_production"
      #  @orders = @orders.map do |i| if i.status(i) == 'In Production'; end end
      #end

      @drops = Drop.where(:order_id => @orders)

      if params[:payment] == "paid"
        @invoices = Invoice.where(:paid => true, :drop_id => @drops)
      end
    end
  end
end
