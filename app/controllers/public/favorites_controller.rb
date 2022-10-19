class Public::FavoritesController < Public::ApplicationController

  before_action :set_course, except: [:index]
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.page(params[:page]).per(12)
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, course_id: @course.id)
    @favorite.destroy
  end

  def create
    if @course.user_id != current_user.id
       @favorite = Favorite.create(user_id: current_user.id, course_id: @course.id)
       @favorite.save
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end
  
end