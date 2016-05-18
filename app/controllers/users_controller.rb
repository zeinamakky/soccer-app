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

    @user.save

    user_photo = UserPhoto.new(
      file: params[:file],
      user_id: @user.id
    )
    user_photo.save

    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find_by(id: params[:id])
    @user_allegiances = UserAllegiance.where(user_id: params[:id])
    @user_games = UserGame.where(user_id: current_user_login.id)
      def two_hours_later
        + 20*60*60
      end
    @games = Game.where('date >= ?', 10.days.ago).where('date < ?', 10.days.from_now)
    render 'show.html.erb'
  end

  def edit
    @user = User.find_by(id: params[:id])
    @user_photo = UserPhoto.find_by(user_id: @user.id)
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      twitter_username: params[:twitter_username],
      fb_username: params[:fb_username],
      avatar: params[:avatar],
      user_login_id: current_user_login.id,
      email: current_user_login.email
    )
    # user_photo = UserPhoto.find_by(user_id: @user.id)

    user_photo = UserPhoto.where(user_id: @user.id)
    if user_photo
      user_photo.destroy_all
    end
    user_photo = UserPhoto.new(
      file: params[:file],
      user_id: @current_user_login.user.id
    )
    user_photo.save

    redirect_to "/users/#{params[:id]}"
  end

  def pic_destroy
    @user = User.find_by(id: params[:id])

    @user_photo = UserPhoto.find_by(user_id: @user.id)
    @user_photo.destroy

  end
  def destroy
    
    @user = User.find_by(id: params[:id])
    @user.destroy

    redirect_to "/"
  end

  
end
