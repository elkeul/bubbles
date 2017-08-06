class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit the Diver `first_name, last_name, certification, metric` parameters
    # along with the other sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:first_name, :last_name, :certification, :metric])
  end

  # for edit ... .sanitizer.permit(:account_update, keys: ...)

  # DEFAULT_PERMITTED_ATTRIBUTES =
  # {
  #   sign_in: [:password, :remember_me],
  #   sign_up: [:password, :password_confirmation],
  #   account_update: [:password, :password_confirmation, :current_password]
  # }


  # # Adding new parameters to be permitted in the `sign_up` action.
  # devise_parameter_sanitizer.permit(:sign_up, keys: [:subscribe_newsletter])

  # # Removing the `password` parameter from the `account_update` action.
  # devise_parameter_sanitizer.permit(:account_update, except: [:password])

  # # Using the block form to completely override how we permit the
  # # parameters for the `sign_up` action.
  # devise_parameter_sanitizer.permit(:sign_up) do |user|
  #   user.permit(:email, :password, :password_confirmation)
  # end

end
