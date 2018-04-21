class SessionsController < ApplicationController
  def new
  end

  def create
    #debugger #puts params.to_yaml ＝＝＝rails s起動　"/login"にアクセス　デバッカーでとめて、コンソールでputs params.to_yaml実行s
    user = User.find_by(email: params[:session][:email])
    #ここではemail情報のみで、ユーザー情報を探しに行く。
    if user && user.authenticate(params[:session][:password]) #ここもparamsハッシュの中のsessionからpasswordを取得している。
      #user True かつ　paramsのpasswordを暗号化したものをauthenticateでうまいこと認証する。
      log_in(user)
      #下にあるdef log_inメソッドを使用する。log_inメソッドはsessionハッシュの中のkey:user_idにuserモデル内のuser_idを代入している。
      redirect_to root_path, alert: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def log_in(user)
    session[:user_id] = user.id
    #下にあるdef log_inメソッドを使用する。log_inメソッドはsessionハッシュの中のkey:user_idにuserモデル内のuser_idを代入している。
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end


# paramsの中身はこうなっている
#Parameters {"utf8"=>"✓", "authenticity_token"=>"BYNnD+9LcL/oKNYK1BYDeWjRSvW3z9PK4K9E3xE5RYsv5sYpE6Q8wko9RpiT3FuQmuYyDjgbnDSDI/Zadk1g5g==", "session"=>{"email"=>"aaa", "password"=>"1234"}, "commit"=>"ログイン", "controller"=>"sessions", "action"=>"create"}
