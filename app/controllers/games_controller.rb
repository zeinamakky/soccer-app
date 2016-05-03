class GamesController < ApplicationController
  def index
    if current_pub_user
      @pubs = current_pub_user.pubs
    end
   
    @premier = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/398/fixtures",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s} 
    ).body
    @ligue1 = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/396/fixtures",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body

    @premier_fixtures = @premier["fixtures"].select do |game|
      DateTime.current + 1 < DateTime.parse(game["date"])
    end

    @ligue1_fixtures = @ligue1["fixtures"].select do |game|
      DateTime.current + 1 < DateTime.parse(game["date"])
    end

    
    # if params[:start_date]
    #   start_date = params[:start_date]
    #   start_day = start_date["day"] 
    #   start_month = start_date["month"]
    #   start_year = start_date["year"]
    #   game_day = "#{start_year}-#{start_month}-#{start_day}"
    #   #game_day = game_day.to_date 
    #   @games = PubGame.where(date: "2016-04-23")
    # end
   
  end

  def show
  end
end
