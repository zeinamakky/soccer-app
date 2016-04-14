class GamesController < ApplicationController
  def index
    @premier = Unirest.get("http://api.football-data.org/v1/soccerseasons/398/fixtures").body
    @ligue1 = Unirest.get("http://api.football-data.org/v1/soccerseasons/396/fixtures").body
     
    @premier_fixtures = @premier["fixtures"].select do |game|
      DateTime.current < DateTime.parse(game["date"])
    end

    @ligue1_fixtures = @ligue1["fixtures"].select do |game|
      DateTime.current < DateTime.parse(game["date"])
    end
  end
end
