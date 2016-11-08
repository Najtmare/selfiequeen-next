class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception, only: Proc.new { |c| c.request.format.json? }

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  def user_not_authorized
    if request.format.json?
      render json: 'You are not authorized to do this action', status: :unprocessable_entity
    else
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
