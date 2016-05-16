class UsersController < ApplicationController
  attr_reader :first_name, :last_name, :twitter_username, :fb_username, :avatar, :user_login_id
  
  def index
    @users = User.all
    
  end
  def new
    @user = User.new
    
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
    # @user_photo = UserPhoto.new(user_photo_params)

    # respond_to do |format|
    #   if @user_photo.save
    #     format.html { redirect_to user_photos_path, notice: 'user_photo was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @user_photo }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @user_photo.errors, status: :unprocessable_entity }
    #   end
    # end
    @user.save
    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find_by(id: params[:id])
    @user_games = UserGame.where(user_id: current_user_login.id)
      def two_hours_later
        + 20*60*60
      end
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
    
    redirect_to "/users/#{params[:id]}"
  end


  def destroy
    
    @user = User.find_by(id: params[:id])
    @user.destroy

    redirect_to "/"
  end

  
end
