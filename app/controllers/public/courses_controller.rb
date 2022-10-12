class Public::CoursesController < ApplicationController

def index
    @genres = Genre.all
  if params[:genre_id]
     @genre = Genre.find(params[:genre_id])
     @courses = @genre.courses.page(params[:page]).per(9)
  else
     @courses = Course.all.page(params[:page]).per(9)
  end
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

  @comment = Comment.new

  favorites = Favorite.where(user_id: current_user.id).pluck(:course_id)
  @favorite_list = Course.find(favorites)

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
  @courses = Course.all
  @course = Course.find(params[:id])
  @course.destroy
   redirect_to courses_path(@course.id)
end

def search
  @genres = Genre.all
  @courses = Course.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
end

private

def course_params
  params.require(:course).permit(:title, :body, :image, :user_id, :genre_id, :score, :address).merge(user_id: current_user.id)
end

end