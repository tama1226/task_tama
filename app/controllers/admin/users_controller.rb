class Admin::UsersController < ApplicationController
  
  def new
  end

  def edit
  end

  def show
  end

  def index
    @users = User.all
  end

  private

  def admin_user
    redirect_to tasks_path unless current_user.admin?
  end
end
