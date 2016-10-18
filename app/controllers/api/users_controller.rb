class Api::UsersController < Api::ApiController
  before_action :authenticate_user!
  before_action :find_user, only: [:show]
  
  def show
    render json: @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end