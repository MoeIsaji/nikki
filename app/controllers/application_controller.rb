class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    case resource
     when Admin
      admin_customers_path
     when Customer
        flash[:notice] = "ログインに成功しました" 
        articles_path  
    end
  end
  
  def after_sign_out_path_for(resource)
    if resource == :admin
       new_admin_session_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
  end
end

