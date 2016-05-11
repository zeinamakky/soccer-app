class Api::V1::GamesController < ApplicationController
  def index
    @premier_matches = Game.where(league: "Premier League").where('date >= ?', Date.current)
    @ligue1_matches = Game.where(league: "Ligue 1").where('date >= ?', Date.current)

    @buli_matches = Game.where(league: "Bundesliga").where('date >= ?', Date.current)

    @serieA_matches = Game.where(league: "Serie A").where('date >= ?', Date.current)

    @eredivisie_matches = Game.where(league: "Eredivisie").where('date >= ?', Date.current)

    @champLeague_matches = Game.where(league: "Champions League").where('date >= ?', Date.current)
    render 'index.json.jbuilder'
  end
end
