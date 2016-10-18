class Api::ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  protected

  def user_not_authorized
    render json: { success: false, error: 'You are not authorized to do this action' }, status: :unprocessable_entity
  end
end
