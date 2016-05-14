namespace :champleague_games do 
  task :fetch => :environment do
    champ_league_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/405/fixtures/",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body

    champ_league_matches["fixtures"].each do |fixture|
      Game.create(
        home_team_name: fixture["homeTeamName"],
        away_team_name: fixture["awayTeamName"],
        date: fixture["date"],
        home_team_goals: fixture["result"]["goalsHomeTeam"],
        away_team_goals: fixture["result"]["goalsAwayTeam"],
        league: "Champions League"
      )
    end
  end
end