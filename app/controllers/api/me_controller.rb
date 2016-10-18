class Api::MeController < Api::ApiController
  before_action :authenticate_user!
  
  def index
    render json: current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :subscribed, :subscribed_until, :email, :avatar)
  end
end