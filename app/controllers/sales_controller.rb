class SalesController < ApplicationController



  def new
    @sale = Sale.new
  end

  def create
    @sale= Sale.new(unit_param)
    if @sale.save
      @log = Log.create(description:"Unit is created :" +@sale.name, user: current_user)
      flash[:success]= "Sales added Sucessfully"
      redirect_to @sale
    else
      render 'new'
    end
  end



  def index
    @page = params[:page] || 1
    @sale = Sale.paginate(:page => params[:page], :per_page =>5)
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])
    @sale.update(unit_param)
    flash[:success]= "Updated sucessfully"
    @log = Log.create(description:"Sales is  updated :" +@sale.name, user: current_user)
    redirect_to @sale
  end

  def destroy
    @sale = Sale.destroy([params[:id]])
    flash[:warning]= "Deleted Sucessfully"
    @log = Log.create(description:"Sales is Deleted :" +@sale.name, user: current_user)
    redirect_to @sale
  end


  private
  def unit_sale
    params.require(:sale).permit(:item_id, :unit_sell_price, :quantity, :cash_credit, :customer_id)
  end
end

