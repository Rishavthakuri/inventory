class FiscalYearsController < ApplicationController


  def create
    @fiscal_year= FiscalYear.new(fiscal_year_param)
    if @fiscal_year.save
      flash[:success]= "Fiscal Year added Sucessfully"
      @log = Log.create(description:"Fiscal Year is Created :" +@fiscal_year.name, user: current_user)
      redirect_to @fiscal_year
    else
      render 'new'
    end
  end

  def destroy
    @fiscal_year = FiscalYear.destroy(params[:id])
    flash[:warning]= "Deleted Sucessfully"
    @log = Log.create(description:"Fiscal Year is Deleted :" +@fiscal_year.name, user: current_user)
    redirect_to @fiscal_year
  end

  def index
    @page = params[:page] || 1
    @fiscal_year= FiscalYear.paginate(:page => params[:page], :per_page =>5)
  end

  def edit
    add_breadcrumb "Edit", :edit_fiscal_year_path
    @fiscal_year = FiscalYear.find(params[:id])
  end
  def show
    @fiscal_year = FiscalYear.find(params[:id])
  end

  def update
    @fiscal_year= FiscalYear.find(params[:id])
    @fiscal_year.update(fiscal_year_param)
    flash[:success]= "Updated sucessfully"
    @log = Log.create(description:"Fiscal Year is  Updated" +@fiscal_year.name, user: current_user)
    redirect_to @fiscal_year
  end

  def new
    @fiscal_year = FiscalYear.new
  end

  private
  def fiscal_year_param
    params.require(:fiscal_year).permit(:name, :start_date, :end_date)
  end
end

