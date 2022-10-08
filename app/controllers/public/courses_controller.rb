class Public::CoursesController < ApplicationController

def index
  @genres = Genre.all
  @courses = Course.all
end

def new
  @course = Course.new
end

def create
  @course = Course.new(course_params)
  @course.save
   redirect_to courses_path
end

def show
  @course = Course.find(params[:id])
  @genres = Genre.all
end

def edit
   @course = Course.find(params[:id])
end

def update
  @course = Course.find(params[:id])
  @course.update(course_params)
   redirect_to course_path(@course.id)
end

def destroy
  @course = Course.find(params[:id])
  @course.destroy
   redirect_to courses_path(@course)
end

private

def course_params
  params.require(:course).permit(:title, :body, :image, :user_id, :genre_id, :score).merge(user_id: current_user.id)
end

end