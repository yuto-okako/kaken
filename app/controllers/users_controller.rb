class UsersController < ApplicationController
  def index
    if logged_in?
      @date = Time.zone.today.strftime('%Y / %-m / %-d (%a)')
      time = Time.zone.now.strftime('%H%M').to_i
      
      if 400 <= time and time <= 959
        @greet = "おはようございます"
        if inputed?
          @text = "今日も1日頑張っていきましょう。"
        else
          @text = "今日の健康観察をしませんか？"
        end
      elsif 1000 <= time and time <= 1759
        @greet = "こんにちは"
        @text = "張り切っていきましょう！。"
      else
        @greet = "こんばんは"
        @text = '今日の項目チェックをしませんか？'
        if checked?
          @text = "今日はどんな1日でしたか？"
        end
      end
      
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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to edit_user_path(@user.id)
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