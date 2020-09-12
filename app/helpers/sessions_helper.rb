module SessionsHelper
  # ユーザー情報でログインする
  def login(user)
    session[:user_name] = user.name
  end

  # 現在ログイン中のユーザーを返す
  def current_user
    if session[:user_name]
      @current_user ||= User.find_by(name: session[:user_name])
    end
  end

  # 現在ログインしているかを判別するメソッド
  def logged_in?
    !current_user.nil?
  end

  # ログアウトするメソッド
  def log_out
    session.delete(:user_name)
    @current_user = nil
  end
end
