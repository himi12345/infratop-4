class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # フラッシュメッセージ
  add_flash_types :success, :info, :warning, :danger

#ログアップ後にuser/showにいきたい
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # sign_upで全項目を埋めたにも関わらず、email can't be blankと出た際に対処する記述
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end