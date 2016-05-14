class UserPhotosController < ApplicationController
  before_action :set_user_photo, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @user_photos = UserPhoto.all
    @user_photo = UserPhoto.new
    
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    send_data(@user_photo.file_contents,
              type: @user_photo.content_type,
              filename: @user_photo.filename)
  end

  # GET /user_photos/new
  def new
    @user_photo = UserPhoto.new
  end

  # POST /documents
  # POST /documents.json
  def create
    @user_photo = UserPhoto.new(user_photo_params)

    respond_to do |format|
      if @user_photo.save
        format.html { redirect_to user_photos_path, notice: 'user_photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_photos/1
  # PATCH/PUT /user_photos/1.json
  def update
    respond_to do |format|
      if @user_photo.update(user_photo_params)
        format.html { redirect_to @user_photo, notice: 'user_photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @user_photo.destroy
    respond_to do |format|
      format.html { redirect_to user_photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_photo
      @user_photo = UserPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_photo_params
      params.require(:user_photo).permit(:file)
    end
end