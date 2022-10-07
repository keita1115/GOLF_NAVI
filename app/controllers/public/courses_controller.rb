class Public::CoursesController < ApplicationController

def index
 
end

def new
  @course = Course.new
end

def create
  @course = Course.new(course_params)
  @course.save
   redirect_to course_path(@course.id)
end

def show
  @course = Course.find(params[:id])
end

def edit
end

def update
  @course = Course.find(params[:id])
  @course.update(course_params)
   redirect_to course_path(@course.id)
end

  private

  def course_params
    params.require(:course).permit(:title, :body, :image, :user_id, :genre_id, :score)
  end

end