class ConsigneesController < ApplicationController

  def index
    @title = "Consignees"
    @customer = Customer.find(params[:customer_id])
    @consignees = @customer.consignees
  end

  def new
    @title = "New Consignee"
    @customer = Customer.find(params[:customer_id])
    @consignee = @customer.consignees.build
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @consignee = @customer.consignees.build(params[:consignee])
    if @consignee.save
      flash[:success] = "Consignee " + @consignee.name + " created!"
      redirect_to customers_path
    else
      @title = "New Consignee"
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @consignee = @customer.consignees.find(params[:id])
  end

    def update
    @customer = Customer.find(params[:customer_id])
    @consignee = Consignee.find(params[:id])
    if @consignee.update_attributes(params[:consignee])
      flash[:success] = "Consignee details updated!"
      redirect_to customers_path
    else
      @title = "Edit Consignee"
      render 'edit'
    end
  end

    def destroy
    Consignee.find(params[:id]).destroy
    flash[:success] = "Consignee deleted!"
    redirect_to customers_path
  end

end
