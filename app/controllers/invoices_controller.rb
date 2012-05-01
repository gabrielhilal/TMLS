class InvoicesController < ApplicationController
  before_filter :factory
  before_filter :commercial, :only => [ :create, :destroy, :edit, :new, :update ]

  def index
    @title = "Invoices"
    @invoices = Invoice.all
  end

  def new
    @title = "New Invoice"
    @drop = Drop.find(params[:drop_id])
    @order = @drop.order
    @invoice = @drop.build_invoice
    @invoice.vat ||= "20"
    @invoice.paid ||= 0
  end

  def create
    @invoice = Invoice.new(params[:invoice])
    @drop = @invoice.drop
    @order = @drop.order
    if @invoice.save
      flash[:success] = "Invoice " + @invoice.number.to_s + " created!"
      redirect_to invoice_path(@invoice)
    else
      @title = "New Invoice"
      render 'new'
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    @title = "Invoice "+ @invoice.number.to_s
  end

  def edit
    @title = "Edit Invoice"
    @invoice = Invoice.find(params[:id])
    @drop = @invoice.drop
    @order = @drop.order
  end

  def update
    @invoice = Invoice.find(params[:id])
    @drop = @invoice.drop
    @order = @drop.order
    if @invoice.update_attributes(params[:invoice])
      flash[:success] = "Invoice details updated!"
      redirect_to invoice_path
    else
      @title = "Edit Invoice"
      render 'edit'
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    flash[:success] = "Invoice deleted!"
    redirect_to order_path(@invoice.drop.order)
  end

end
