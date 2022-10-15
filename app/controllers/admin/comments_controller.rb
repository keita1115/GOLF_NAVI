class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @comment = Comment.find(params[:id])
    user = User.find(params[:user_id])
    Comment.find(params[:id]).destroy
    redirect_to admin_user_path(user), notice: 'コメントを削除しました。'
  end

end
