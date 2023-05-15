class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password, :reset_password_token, :last_name, :first_name, :last_name_kana, :first_namr_kana, :postal_code, :address, :telephone_number, ])
  end
end