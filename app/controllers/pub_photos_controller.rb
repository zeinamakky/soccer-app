class PubPhotosController < ApplicationController
  before_action :set_pub_photo, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @pub_photos = PubPhoto.all
    @pub_photo = PubPhoto.new
    
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    send_data(@pub_photo.file_contents,
              type: @pub_photo.content_type,
              filename: @pub_photo.filename)
  end

  # GET /pub_photos/new
  def new
    @pub_photo = PubPhoto.new
  end

  # POST /documents
  # POST /documents.json
  def create
    @pub_photo = PubPhoto.new(pub_photo_params)

    respond_to do |format|
      if @pub_photo.save
        format.html { redirect_to pub_photos_path, notice: 'pub_photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pub_photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @pub_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pub_photos/1
  # PATCH/PUT /pub_photos/1.json
  def update
    respond_to do |format|
      if @pub_photo.update(pub_photo_params)
        format.html { redirect_to @pub_photo, notice: 'pub_photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pub_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @pub_photo.destroy
    respond_to do |format|
      format.html { redirect_to pub_photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pub_photo
      @pub_photo = PubPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pub_photo_params
      params.require(:pub_photo).permit(:file)
    end
end
