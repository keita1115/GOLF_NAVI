class Admin::CoursesController < ApplicationController

  def show
    @course = Course.find(params[:id])
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    redirect_to admin_root_path
  end

  private

  def course_params
    params.require(:course).permit(:title, :body, :image, :user_id, :genre_id, :score, :address)
  end

end
