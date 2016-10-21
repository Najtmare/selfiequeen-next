class Admin::PhotosController < Admin::ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    case params[:state]
    when 'approved' then @photos = Photo.approved_status
    when 'denied' then @photos = Photo.denied_status
    else
      @photos = Photo.pending_status
    end
  end

  # GET /photos/1/edit
  def edit
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image, :user_id, :status)
    end
end
