class UsersController < ApplicationController
  attr_reader :first_name, :last_name, :twitter_username, :fb_username, :avatar, :user_login_id
  def index
    @users = User.all
  end
  def new
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
    @user.save
    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find_by(id: params[:id])
    @user_games = UserGame.where(user_id: current_user_login.id)
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
end
