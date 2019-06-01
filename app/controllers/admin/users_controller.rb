class Admin::UsersController < ApplicationController
  before_action :set_user,only:[:show,:edit,:update,:destroy]

  def index
    @users=User.all.includes(:tasks)
    @users= @users.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    
    if @user.save
      redirect_to admin_users_path, notice: "ユーザーを登録しました！"
    else
      render 'admin/users/new'
    end
  end

  def edit
  end

  def update
    @user.update!(user_params)
    redirect_to admin_users_path, notice: "ユーザー情報を更新しました！"
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザーを削除しました！"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:admin,:password,:password_confirmation)
  end

  def set_user
    @user=User.find(params[:id])
  end

end
