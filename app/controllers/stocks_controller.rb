class StocksController < ApplicationController
  def new
    @stock = Stock.new
  end
  def create
    @stock= Stock.new(stock_param)
    if @stock.save
      flash[:success]= "Stock added Sucessfully"
      redirect_to @stock
    else
      render  'new'
    end
  end

  def index
    @page = params[:page] || 1
    @stock = Stock.paginate(:page => params[:page], :per_page =>5)
  end

  def edit
    add_breadcrumb "Edit", :edit_stock_path
    @stock = Stock.find(params[:id])
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    @stock .update(Stock_param)
    flash[:success]= "Updated sucessfully"
    redirect_to @stock
  end

  def destroy
    @stock = Stock.destroy([params[:id]])
    flash[:warning]= "Deleted Sucessfully"
    redirect_to @stock
  end


  private
  def stock_param
    params.require(:Item).permit(:item_id, :quantity, :unit_price, :est_sell_price)
  end
end
