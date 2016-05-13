class Api::V1::UserGamesController < ApplicationController
  def index
    @user_games = UserGame.all
    render 'index.json.jbuilder'
  end

  def create
    @user_game = UserGame.create(
      user_id: params[:user_id],
      game_id: params[:game_id],
      pub_id: params[:pub_id]

    )
    render 'show.json.jbuilder'
  end
end
