class Admin::UsersController < ApplicationController

def index
   @users = User.page(params[:page])
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

def withdrawal
  # @user = current_user
  current_user.update(is_deleted: true)
  reset_session
  flash[:notice] = "退会処理を行いました"
  redirect_to root_path
end

private
 def user_params
   params.require(:user).permit(:name, :email, :is_deleted)
 end

end