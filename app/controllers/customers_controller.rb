class CustomersController < ApplicationController
  def index
    @title = "Customers"
    @customers = Customer.all
  end

  def new
    @title = "New Customer"
    @customer = Customer.new
  end

  def create
    @customer=Customer.new(params[:customer])
    if @customer.save
      flash[:success] = "Customer " + @customer.name + " created!"
      redirect_to customers_path
    else
      @title = "New Customer"
      render 'new'
    end
  end

  def edit
    @title = "Edit Customer"
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params[:customer])
      flash[:success] = "Customer details updated!"
      redirect_to customers_path
    else
      @title = "Edit Customer"
      render 'edit'
    end
  end

  def destroy
    Customer.find(params[:id]).destroy
    flash[:success] = "Customer deleted!"
    redirect_to customers_path
  end

end

