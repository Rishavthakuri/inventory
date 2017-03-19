class ItemGroupsController < ApplicationController

  def create
    @item_group= ItemGroup.new(item_group_param)
    if @item_group.save
      flash[:success]= "Item Group added Sucessfully"
      @log = Log.create(description:"Item Group is Created :" + @item_group.name, user: current_user)
      redirect_to @item_group
    else
      render 'new'
    end
  end

  def index
    @page = params[:page] || 1
    @item_group = ItemGroup.paginate(:page => params[:page], :per_page =>5)
  end

  def edit
    add_breadcrumb "Edit", :edit_item_group_path
    @item_group = ItemGroup.find(params[:id])
  end

  def show
    @item_group= ItemGroup.find(params[:id])
  end

  def update
    @item_group= ItemGroup.find(params[:id])
    @item_group.update(item_group_param)
    flash[:success]= "Updated sucessfully"
    @log = Log.create(description:"Item Group is Updated :" + @item_group.name, user: current_user)
    redirect_to @itemgroup
  end

  def destroy
    @item_group = ItemGroup.find(params[:id])
    @log = Log.create(description:"Item is  Deleted :" + @item_group.name, user: current_user)
    @item_group.destroy
    flash[:warning]= "Deleted Sucessfully"
    redirect_to "/item_groups"
  end

  def new
    add_breadcrumb "New", :new_item_group_path
    @item_group = ItemGroup.new
  end

  private
  def item_group_param
    params.require(:item_group).permit(:name, :parent_id ,:description)
  end
end
