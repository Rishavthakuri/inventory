class UnitsController < ApplicationController

  def create
    @unit= Unit.new(unit_param)
    if @unit.save
      @log = Log.create(description:"Unit is created :" +@unit.name, user: current_user)
      flash[:success]= "Unit added Sucessfully"
      redirect_to @unit
    else
      render 'new'
    end
  end

  def index
    @page = params[:page] || 1
    @unit = Unit.paginate(:page => params[:page], :per_page =>5)
  end

  def edit
    add_breadcrumb "Edit", :edit_unit_path
    @unit = Unit.find(params[:id])
  end
  def show
    @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:id])
    @unit.update(unit_param)
    flash[:success]= "Updated sucessfully"
    @log = Log.create(description:"Unit is  updated :" +@unit.name, user: current_user)
    redirect_to @unit
  end

  def destroy
    @unit = Unit.find(params[:id])
    @log = Log.create(description:"Unit is  Deleted :" + @unit.name, user: current_user)
    @unit.destroy
    flash[:warning]= "Deleted Sucessfully"
    redirect_to "/units"
  end

  def new
    @unit = Unit.new
  end

  private
  def unit_param
    params.require(:unit).permit(:name, :print_name)
  end
end
