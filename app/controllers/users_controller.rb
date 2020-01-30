class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end
  def new
    @users = User.new
  end

  def create
    @users = User.create(user_params)
    if @users.save
      flash[:success]="uSER WAS ADDED SUCCESSFULLY";
      redirect_to @users
    else
      flash[:error]="uSER WAS NOT ADDED";
      render :new
    end
  end
  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.update(section_params)
    if @users.save()
      flash[:success]="uSER WAS SUCCESSFULLY UPDATED";
      redirect_to @users
    else
      flash[:error]="uSER WAS NOT UPDATED";
      render :edit
    end
  end
  def destroy
    User.find(params[:id]).destroy
  end

  private
  def section_params
    params.require(:user).permit(:name,:lastname,:address)
  end
end
