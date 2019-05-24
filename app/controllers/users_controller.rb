class UsersController < ApplicationController
  #ユーザー登録時のみ、このアクションはかからない
  skip_before_action :login_required

  def new
    @user=User.new
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
