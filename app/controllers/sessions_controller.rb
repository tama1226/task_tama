class SessionsController < ApplicationController
  #ログイン時のみ、このアクションはかからない
  skip_before_action :login_required

  def new
  end

  def create
    user=User.find_by(email:params[:session][:email].downcase)
      #パスワードとメールアドレスの組み合わせの有効性
      if user && user.authenticate(params[:session][:password])
        #sessionメソッドによるログイン
        session[:user_id] = user.id
        #ユーザー詳細ページへ遷移
        redirect_to user_path(user.id)
      else
        flash[:danger] = 'ログインできません！'
        render 'new'
      end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end
