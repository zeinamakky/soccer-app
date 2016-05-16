class PubGamesController < ApplicationController
  def index
    @pubs = Pub.all
    
    @team = Team.all

    if params[:search_date]
      search_date = params[:search_date].to_datetime

      @pub_games = Game.where(date: search_date..search_date+1)
    
    else 
      @pub_games = Game.where('date >= ?', 5.days.ago)
    end

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
