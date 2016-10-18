class Api::RatingsController < Api::ApiController
  before_action :authenticate_user!
  before_action :find_rating, only: [:update, :destroy]
  after_action  :verify_authorized, only: [:update, :destroy]

  def create
    @rating = Rating.create(rating_params)

    if @rating.save
      render json: @rating, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end   
  end

  def update
    authorize @rating

    if @rating.update(rating_params)
      render json: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @rating

    @rating.destroy
  end

  def find_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:ratings).permit(:user_id, :photo_id, :stars)
  end
end