class Api::V1::GamesController < ApplicationController
  def index
    @premier_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/398/fixtures",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body
    @ligue1_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/396/fixtures/",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body

    @buli_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/394/fixtures/",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body

    @serieA_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/401/fixtures/",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body

    @eredivisie_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/404/fixtures/",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body

    @champLeague_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/405/fixtures/",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body
    render 'index.json.jbuilder'
  end
end
