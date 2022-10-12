class Public::HomesController < ApplicationController

def top
  if params[:genre_id]
     @genre = Genre.find(params[:genre_id])
     @courses = @genre.courses.page(params[:page]).per(3)
  else
     @courses = Course.all.page(params[:page]).per(3)
  end
     @genres = Genre.all
end

def about
end

end