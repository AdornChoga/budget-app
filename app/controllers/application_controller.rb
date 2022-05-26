class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:image, :name, :email, :password_confirmation, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:image, :name, :email, :password_confirmation, :password, :current_password)
    end
  end
end
