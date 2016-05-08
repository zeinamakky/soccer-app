class PubGamesController < ApplicationController
  def index
    @pubs = Pub.all
    @pub_games = PubGame.all
    # if params[:start_date]
    #   start_date = params[:start_date]
    #   start_day = start_date["day"] 
    #   start_month = start_date["month"]
    #   start_year = start_date["year"]
    #   game_day = "#{start_year}-#{start_month}-#{start_day}"
    #   #game_day = game_day.to_date 
    #   @pub_games = PubGame.where(date: game_day)
    # end
  end
  def create
    @pub_game = PubGame.new(
      pub_id: params[:pub][:pub_id],
      home_team: params[:home_team],
      away_team: params[:away_team],
      league: params[:league],
      date: params[:date],
      time: params[:time].to_time,
      home_team_icon_id: nil,
      away_team_icon_id: nil
    )
    @pub_game.save
    redirect_to "/pub_games"

  end
end
