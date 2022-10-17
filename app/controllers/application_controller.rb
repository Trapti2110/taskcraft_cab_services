class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  

  def after_sign_in_path_for(driver)
    # byebug 
    if current_admin_user   # can also run without .admin?
      admin_driver_requests_path
    elsif driver.is_driver == true
      loged_in_driver_cabs_path
    else
      cabs_path
    end
  end

  def configure_permitted_parameters 
  	# binding.pry
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :confirm_password, :role_id])
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name)}
  end
end

