module SessionsHelper
  #ログインを行う
  def log_in(user)
    session[:user_id] = user.id  #セッションにユーザIDを保存
  end
  
  #ログアウトを行う
  def log_out
    session.delete(:user_id)  #セッションからユーザIDを削除
    @current_user = nil       #現在のユーザをnilで初期化
  end
  
  #ユーザがログイン中なら、現在ログイン中のユーザの情報を返す
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id]) #@current_userがnilなら、find_byメソッドでidがセッションに保存されたユーザIDに一致するデータを代入
    end
  end
  
  #引数で受け取ったユーザがログイン中のユーザならtrueを返す
  def current_user?(user)
    user == current_user
  end
  
  #ログインしていればtrueを返す
  def logged_in?
    !current_user.nil?  #ログイン中 => current_userはnilでない
  end
  
end