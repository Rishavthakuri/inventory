class CustomersController < ApplicationController



  def new
    @customer = Customer.new
  end

  def create
    @customer= Customer.new(customer_param)
    if @customer.save
      flash[:success]= "Customer added Sucessfully"
      @log = Log.create(description:"Customer is created :" +@customer.name, user: current_user)
      redirect_to @customer
    else
      render 'new'
    end
  end

  def index
    @page = params[:page] || 1
    @customer = Customer.paginate(:page => params[:page], :per_page =>5)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_param)
    flash[:success]= "Updated sucessfully"
    @log = Log.create(description:"Customer is  updated :" +@customer.name, user: current_user)
    redirect_to @customer
  end

  def destroy
    @customer = Customer.destroy([params[:id]])
    flash[:warning]= "Deleted Sucessfully"
    @log = Log.create(description:"Customer is Deleted :" +@customer.name, user: current_user)
    redirect_to @customer
  end



  private
  def customer_param
    params.require(:customer).permit(:name,:address,:phone_number)
  end
end


