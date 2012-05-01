class SearchController < ApplicationController
  before_filter :factory

  def index
    if  params[:c_style] == '' and  params[:style] == '' and params[:construction] == ''
      flash[:error]= 'Please fill in at least one of the fields: "Style", "Construction", "Customer Style"'
      redirect_to search_index_path
    else
      @customer = Customer.where(:id => params[:customer])
      @factory = Factory.where(:id => params[:factory])

      if params[:customer] == "Select Customer" and params[:factory] == "Select Factory"
        @orders = Order.all
      elsif params[:factory] == "Select Factory"
        @orders = Order.where(:customer_id => @customer)
      elsif params[:customer] == "Select Customer"
        @orders = Order.where(:factory_id => @factory)
      else
        @orders = Order.where("customer_id = ? AND factory_id = ?", @customer, @factory)
      end

      @drops = Drop.where(:order_id => @orders)

      @styles = Style.where("style ILIKE ? ", "%#{params[:style]}%")
      @constructions = Style.where("construction ILIKE ? ", "%#{params[:construction]}%")

      @items = Item.where(:drop_id => @drops)
      @items = @items.where(:style_id => @styles)
      @items = @items.where(:style_id => @constructions)
      unless params[:c_style] == ''
        if @items.nil?
          @items = Item.where("customer_style ILIKE ? ", "%#{params[:c_style]}%")
        else
          @items = @items.where("customer_style ILIKE ? ", "%#{params[:c_style]}%")
        end
      end
    end
  end
end
