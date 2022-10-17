class Admin::HomesController < ApplicationController

def top
   @courses = Course.all.page(params[:page]).per(10)
end

end
