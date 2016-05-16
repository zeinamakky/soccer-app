class Api::V1::GamesController < ApplicationController
  def index
    @premier_matches = Game.where(league: "Premier League").where('date >= ?', 10.days.ago)
    @ligue1_matches = Game.where(league: "Ligue 1").where('date >= ?', 10.days.ago)

    @buli_matches = Game.where(league: "Bundesliga").where('date >= ?', 10.days.ago)

    @serieA_matches = Game.where(league: "Serie A").where('date >= ?', 10.days.ago)

    @eredivisie_matches = Game.where(league: "Eredivisie").where('date >= ?', Date.current)

    @champLeague_matches = Game.where(league: "Champions League").where('date >= ?', Date.current)
    render 'index.json.jbuilder'
  end
end
