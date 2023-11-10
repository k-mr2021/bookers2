class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログインしてない場合、top,about以外にアクセスした場合、loginだけが表示される
  before_action :authenticate_user!, except: [:top, :about]
  
  def after_sign_in_path_for(resurce)
    user_path(current_user.id)
  end
  
  def after__sign_out_path_for(resource)
    root_path
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    
  end
  
end


