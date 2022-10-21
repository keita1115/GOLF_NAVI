class Public::CommentsController < Public::ApplicationController
  before_action :authenticate_user!

  def create
    @course = Course.find(params[:course_id])
    @comment = current_user.comments.new(comment_params)
    @comment.course_id = @course.id
    @comment.user_id = current_user.id
    @comment.save
  end

  def destroy
    course = Comment.find(params[:id])
    course.destroy
    @course = Course.find(params[:course_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
