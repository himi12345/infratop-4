class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

# ログアップ後にuser/showにいきたい
  def after_sign_up_path_for(resource)
    user_path(@user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # sign_upで全項目を埋めたにも関わらず、email can't be blankと出た際に対処する記述
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end