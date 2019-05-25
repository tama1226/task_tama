class ApplicationController < ActionController::Base

  before_action :login_required
  #SessionHelper内のモジュールを使用可能
  protect_from_forgery with: :exception
  include SessionsHelper
  
  #まずはログイン機能が作動
  def login_required
    redirect_to new_session_path unless current_user
  end
end
