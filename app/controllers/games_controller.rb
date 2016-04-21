class GamesController < ApplicationController
  def index
    if current_pub_user
      @pubs = current_pub_user.pubs
    end
    @premier = Unirest.get("http://api.football-data.org/v1/soccerseasons/398/fixtures").body
    @ligue1 = Unirest.get("http://api.football-data.org/v1/soccerseasons/396/fixtures").body
     
    @premier_fixtures = @premier["fixtures"].select do |game|
      DateTime.current + 1 < DateTime.parse(game["date"])
    end

    @ligue1_fixtures = @ligue1["fixtures"].select do |game|
      DateTime.current + 1 < DateTime.parse(game["date"])
    end

    # start_year = params[:start_date["year"]]
    # start_month = params[:start_date["month"]]
    # start_day = params[:start_date["day"]]
    # start_date = Date.new(start_year, start_month, start_day)
    
    if start_date
      @games = PubGame.where(date: start_date)
    end
  end

  def show
  end
end
