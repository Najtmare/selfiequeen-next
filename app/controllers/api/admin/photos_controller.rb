class Api::Admin::PhotosController < Api::ApplicationController
  before_action :set_photo, only: [:show, :update, :destroy]

  # GET /photos
  def index
    case params[:state]
    when 'approved' then @photos = Photo.approved_status
    when 'denied' then @photos = Photo.denied_status
    else
      @photos = Photo.pending_status
    end

    render json: @photos
  end

  # GET /photos/1
  def show
    render json: @photo
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      render json: @photo, status: :created, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo ||= Photo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def photo_params
      params.require(:photo).permit(:title, :image, :user_id, :status)
    end
end