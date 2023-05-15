class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  #この行でtopアクション以外のすべてのアクションに対して、ユーザー認証を要求しているため、home_about_pathのパスに遷移できなかった。
  #before_action :authenticate_user!, except: [:top]
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
  end
end
