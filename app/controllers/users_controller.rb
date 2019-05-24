class UsersController < ApplicationController
  #ユーザー登録時のみ、このアクションはかからない
  skip_before_action :login_required

  def new
    #ログイン中なら、新規ユーザー登録画面には遷移しない
    if logged_in?
      redirect_to user_path(current_user.id)
      flash[:notice] = 'ログイン中'
    else
      @user=User.new
    end
  end

  def create
    @user=User.new(user_params)
      if @user.save
        #ユーザー登録後に詳細ページに遷移（同時にログイン）
        redirect_to user_path(@user.id)
      else
        render 'new'
      end
  end

  def show
    @user=User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,
                                 :password_confirmation)
  end
end
