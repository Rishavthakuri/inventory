class ItemsController < ApplicationController



  def destroy
    @item = Item.find(params[:id])
    @log = Log.create(description:"Item is  Deleted :" + @item.name, user: current_user)
    @item.destroy
    flash[:warning]= "Deleted Sucessfully"
    redirect_to "/items"
  end

  def new
    @item = Item.new
    @item.build_stock
  end

  def create
      @item= Item.new(item_param)
      if @item.save
        flash[:success]= "Items added Sucessfully"
        @log = Log.create(description:"Item is Created :" + @item.name, user: current_user)
        redirect_to @item
      else
        render  'new'
      end
  end

  def index
      @page = params[:page] || 1
      @item = Item.paginate(:page => params[:page], :per_page =>5)
  end

  def edit

      @item = Item.find(params[:id])
  end

  def show
      @item = Item.find(params[:id])
  end

  def update
      @item = Item.find(params[:id])
      @item .update(item_param)
      flash[:success]= "Updated sucessfully"
      @log = Log.create(description:"Item is  Updated :" + @item.name, user: current_user)
      redirect_to @item
  end



  private
  def item_param
      params.require(:item).permit(:name, :unit_id, :item_code, :item_group_id, :description, stock_attributes: [:item_id,:quantity, :unit_price, :est_sell_price ])
  end
end

