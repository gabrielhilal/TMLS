class BanksController < ApplicationController
  before_filter :factory
  before_filter :commercial, :only => [ :create, :destroy, :edit, :new, :update ]

  def index
    @title = "Banks"
    @banks = Bank.all
  end

  def new
    @title = "New Bank"
    @bank = Bank.new
  end

  def create
    @bank=Bank.new(params[:bank])
    if @bank.save
      flash[:success] = "Bank created!"
      redirect_to banks_path
    else
      @title = "New Bank"
      render 'new'
    end
  end

  def edit
    @title = "Edit Bank"
    @bank = Bank.find(params[:id])
  end

  def update
    @bank = Bank.find(params[:id])
    if @bank.update_attributes(params[:bank])
      flash[:success] = "Bank details updated!"
      redirect_to banks_path
    else
      @title = "Edit Bank"
      render 'edit'
    end
  end

  def destroy
    @bank = Bank.find(params[:id])
    if @bank.invoices.count == 0
      @bank.destroy
      flash[:success] = "Bank deleted!"
      redirect_to banks_path
    else
      flash[:error] = "Bank can't be deleted, there are invoices related to this bank"
      redirect_to banks_path
    end
  end

end

