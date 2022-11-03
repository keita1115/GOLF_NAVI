class Public::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

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
    redirect_to root_path, notice: 'ゲストユーザーはこの操作は出来ません。' if current_user.name == 'guestuser'
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
     if @course.save
       redirect_to courses_path
     else
       render :new
     end
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
     if @course.update(course_params)
       redirect_to course_path(@course.id)
     else
       render :edit
     end
  end

  def destroy
    @courses = Course.all
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path(@course.id)
  end

  def search
    @genres = Genre.all
    @courses = Course.search(params[:keyword]).page(params[:page]).per(9)
    @keyword = params[:keyword]
    render "index"
  end

  private

  def course_params
    params.require(:course).permit(:title, :body, :image, :user_id, :genre_id, :score, :address).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    @course = Course.find(params[:id])
    unless @course.user == current_user
       redirect_to courses_path
    end
  end

end