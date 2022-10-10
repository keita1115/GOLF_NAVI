class Public::FavoritesController < ApplicationController

 before_action :set_course, except: [:index] #exceptは覗く時に活用
 before_action :authenticate_user!

def index
   @favorites = Favorite.all
end

def destroy
  @favorite = Favorite.find_by(user_id: current_user.id, course_id: @course.id)
  @favorite.destroy
   redirect_to course_path(params[:course_id])
end

def create
  if @course.user_id != current_user.id   # 投稿者本人以外
     @favorite = Favorite.create(user_id: current_user.id, course_id: @course.id)
     @favorite.save
      redirect_to course_path(params[:course_id])
  end
end

private

  def set_course
    @course = Course.find(params[:course_id])
  end
end
