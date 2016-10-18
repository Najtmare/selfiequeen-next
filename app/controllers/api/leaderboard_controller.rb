class Api::LeaderboardController < Api::ApiController
  before_action :authenticate_user!
  
  def index
    @users = User.average_rating

    render json: @users
  end
end