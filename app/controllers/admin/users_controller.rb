class Admin::UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.update!(is_deleted: true)
    flash[:notice] = "退会処理を行いました"
    redirect_to admin_users_path
  end

  private
   def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
   end

end