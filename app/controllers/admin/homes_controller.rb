class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @courses = Course.all.page(params[:page]).per(10)
  end

end
