class UsersController < ApplicationController
  def index
    #ログイン中ならユーザの情報を取得
    if logged_in?
      @user = current_user
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @profile = Profile.new
      @profile.user_id = @user.id
      @profile.save
      redirect_to root_path
    else
      render 'users/new'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end