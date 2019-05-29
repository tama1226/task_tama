class Admin::UsersController < ApplicationController
  def index
    @users=User.all
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
      redirect_to users_url, notice: "完了しました！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update!(user_params)
    redirect_to users_url, notice: "更新しました！"
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "タスクを削除しました！"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
