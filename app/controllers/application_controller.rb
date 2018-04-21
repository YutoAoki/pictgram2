class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    #@current_user = @current_user or User.find_by(id: session[:user_id])
    #上記と同じ意味の省略形。current_userが既にいれば、current_userを代入、
    #current_userがいなければ、Userから見つけてくる。
  end

  def logged_in?
    !current_user.nil?
  end
end
