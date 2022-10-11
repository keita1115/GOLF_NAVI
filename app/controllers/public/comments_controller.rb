class Public::CommentsController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @comment = current_user.comments.new(comment_params)
    @comment.course_id = @course.id
    if @comment.save
      flash.now[:notice] = 'コメントを投稿しました'
      render :course_comments
    else
      render :error  #render先にjsファイルを指定
    end
  end

  def destroy
    Comment.find_by(id: params[:id], course_id: params[:course_id]).destroy
    flash.now[:alert] = '投稿を削除しました'
    @course = Course.find(params[:course_id])
     render :course_comments
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
