class CompanyProfilesController < ApplicationController


  def create
    @company_profile= CompanyProfile.new(company_profile_param)
    if @company_profile.save
      flash[:success]= "Company Profile added Sucessfully"
      @log = Log.create(description:"Company Profile is  Created :" +@company_profile.name, user: current_user)
      redirect_to @company_profile
    else
      render 'new'
    end
  end

  def index
    @page = params[:page] || 1
    @company_profile = CompanyProfile.paginate(:page => params[:page], :per_page =>5)
  end

  def edit
    add_breadcrumb "Edit", :edit_company_profile_path
    @company_profile = CompanyProfile.find(params[:id])
  end

  def show
    @company_profile = CompanyProfile.find(params[:id])
  end

  def update
    @company_profile= CompanyProfile.find(params[:id])
    @company_profile.update(company_profile_param)
    flash[:success]= "Updated sucessfully"
    @log = Log.create(description:"Company Profile is  Updated :" +@company_profile.name, user: current_user)
    redirect_to "company_profiles/23/edit"
  end

  def destroy
    @company_profile = CompanyProfile.destroy([params[:id]])
    flash[:warning]= "Deleted Sucessfully"
    @log = Log.create(description:"Company Profile is Deleted :" +@fiscal_year.name, user: current_user)
    redirect_to @company_profile
  end

  def new
    add_breadcrumb "New", :new_company_profile_path
    @company_profile= CompanyProfile.new
  end

  private
  def company_profile_param
    params.require(:company_profile).permit(:name, :address, :vdc_mun, :ward_no,:phone_no, :vat_pan_no, :logo, :district, :zone, :fiscal_year_id)
  end
end

