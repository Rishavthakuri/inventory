class UsersController < ApplicationController


  def create
    @user= Item.new(user_param)
    if @user.save
      flash[:success]= "User added Sucessfully"
      @log = Log.create(description:"User Created" +@user.email, user: current_user)
      redirect_to @user
    else
      render  'new'
    end
  end

  def new
    @user= User.new
  end

  def index
    @page =params[:page] || 1

    @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  def update
    @user= User.find(params[:id])
    @user.update(user_param)
    flash[:success]= "Updated sucessfully"
    @log = Log.create(description:"User Updated" +@user.email, user: current_user)
    redirect_to @user
  end

  def edit
    @user = User.find(params[:id])

  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user = Log.create(description:"User is Deleted :" + @user.name, user: current_user)
    @user.destroy
    flash[:warning]= "Deleted Sucessfully"
    redirect_to "/users"
  end

  private
  def user_param
    params.require(:users).permit(:email, :password, :password_conformation )
  end
end
