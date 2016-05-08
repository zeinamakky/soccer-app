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

 
  end

  def show
  end
end
