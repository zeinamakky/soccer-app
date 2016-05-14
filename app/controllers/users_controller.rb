class UsersController < ApplicationController
  attr_reader :first_name, :last_name, :twitter_username, :fb_username, :avatar, :user_login_id
  # accepts_nested_attributes_for :user_photo

  def index
    @users = User.all
    @user_photos = UserPhoto.all
    @user_photo = UserPhoto.new
    
  end
  def new
    @user_photo = UserPhoto.new
    @user = User.new
    
    'render new.html.erb'
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      twitter_username: params[:twitter_username],
      fb_username: params[:fb_username],
      avatar: params[:avatar],
      email: current_user_login.email,
      user_login_id: current_user_login.id
    )
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
    @user.save
    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find_by(id: params[:id])
    @user_games = UserGame.where(user_id: current_user_login.id)
    send_data(@user_photo.file_contents,
              type: @user_photo.content_type,
              filename: @user_photo.filename)
    render 'show.html.erb'
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User
    .find_by(id: params[:id])
    .update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      twitter_username: params[:twitter_username],
      fb_username: params[:fb_username],
      avatar: params[:avatar],
      user_login_id: current_user_login.id,
      email: current_user_login.email
    )
    respond_to do |format|
      if @user_photo.update(user_photo_params)
        format.html { redirect_to @user_photo, notice: 'user_photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_photo.errors, status: :unprocessable_entity }
      end
    end
    redirect_to "/users/#{params[:id]}"
  end


  def destroy
    @user_photo.destroy
    respond_to do |format|
      format.html { redirect_to user_photos_url }
      format.json { head :no_content }
    end
    @user = User.find_by(id: params[:id])
    @user.destroy

    redirect_to "/"
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
