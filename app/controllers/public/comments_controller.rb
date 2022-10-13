class Public::CommentsController < ApplicationController

  def create
    redirect_to root_path, notice: 'ゲストユーザーはこの操作は出来ません。' if current_user.name == 'guestuser'
    @course = Course.find(params[:course_id])
    @comment = current_user.comments.new(comment_params)
    @comment.course_id = @course.id
    @comment.user_id = current_user.id
    @comment.save
    #render :comment
  end

  def destroy
    course = Comment.find(params[:id])
    course.destroy
    @course = Course.find(params[:course_id])
    #render :comment
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
