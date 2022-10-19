class Public::HomesController < Public::ApplicationController

  def top
    @all_ranks = Course.find(Favorite.group(:course_id).order('count(course_id) desc').limit(3).pluck(:course_id))
    @courses = Course.all.page(params[:page]).per(3)
  end

  def about
  end

end