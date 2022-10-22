class Public::UsersController < Public::ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    redirect_to root_path, notice: 'ゲストユーザーはこの操作は出来ません。' if current_user.name == 'guestuser'
    @user = User.find(params[:id])
    @courses = @user.courses.page(params[:page]).per(3)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def unsubscribe
  end

  def withdrawal
    current_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を行いました"
    redirect_to root_path
  end


  def user_params
    params.require(:user).permit(:email, :name)
  end

  def ensure_guest_user
     @user = User.find(params[:id])
   if @user.name == "guestuser"
     redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
   end
  end

end
