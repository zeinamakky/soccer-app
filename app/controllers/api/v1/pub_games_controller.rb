class Api::V1::PubGamesController < ApplicationController
  def index
    @pub_games = PubGame.all
    render 'index.json.jbuilder'
  end

  def create
    @pub_game = PubGame.create(
      pub_id: params[:pub_id],
      game_id: params[:game_id],
      date: params[:date]
    )
    
    
    render 'show.json.jbuilder'
  end
end
