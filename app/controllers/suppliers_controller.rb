class SuppliersController < ApplicationController

  def new
    @supplier = Supplier.new
  end
  
  def create
    @supplier= Supplier.new(supplier_param)
    if @supplier.save
      flash[:success]= "suppliers added Sucessfully"
      @log = Log.create(description:"supplier is Created :" + @supplier.name, user: current_user)
      redirect_to @supplier
    else
      render  'new'
    end
  end


  def index
    @page = params[:page] || 1
    @supplier = Supplier.paginate(:page => params[:page], :per_page =>5)
  end

  def edit

    @supplier = Supplier.find(params[:id])
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    @supplier .update(supplier_param)
    flash[:success]= "Updated sucessfully"
    @log = Log.create(description:"supplier is  Updated :" + @supplier.name, user: current_user)
    redirect_to @supplier
  end


  def destroy
    @supplier = Supplier.destroy([params[:id]])
    flash[:warning]= "Deleted Sucessfully"
    @log = Log.create(description:"supplier is  Deleted :" + @supplier.name, user: current_user)
    redirect_to @supplier
  end

  private
  def supplier_param
    params.require(:supplier).permit(:name, :address, :phone_number, :email)
  end
end
