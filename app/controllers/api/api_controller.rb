class Api::ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception, only: Proc.new { |c| c.request.format.json? }

  protected

  def user_not_authorized
    render json: { success: false, error: 'You are not authorized to do this action' }, status: :unprocessable_entity
  end
end
