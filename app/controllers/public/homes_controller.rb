class Public::HomesController < Public::ApplicationController

def top
   @all_ranks = Course.find(Favorite.group(:course_id).order('count(course_id) desc').limit(3).pluck(:course_id))
  # if params[:genre_id]
  #   @genre = Genre.find(params[:genre_id])
  #   @courses = @genre.courses.page(params[:page]).per(3)
  # else
   @courses = Course.all.page(params[:page]).per(3)
  # end
  #   @genres = Genre.all
end

def about
end

end