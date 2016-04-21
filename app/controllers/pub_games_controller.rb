class PubGamesController < ApplicationController
  
  def create
    @pub_game = PubGame.new(
      pub_id: params[:pub][:pub_id],
      home_team: params[:home_team],
      away_team: params[:away_team],
      league: params[:league],
      date: params[:date],
      time: params[:time],
      home_team_icon_id: nil,
      away_team_icon_id: nil
    )
    @pub_game.save
    redirect_to "/games"

  end
end
