class ApplicationController < ActionController::Base
  #SessionHelper内のモジュールを使用可能
  protect_from_forgery with: :exception
  include SessionsHelper
end
