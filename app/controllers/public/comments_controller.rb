class Public::CommentsController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @comment = current_user.comments.new(comment_params)
    @comment.course_id = @course.id
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
