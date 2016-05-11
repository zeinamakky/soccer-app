namespace :games do 
  task :fetch => :environment do
    premier_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/398/fixtures",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body
    premier_matches["fixtures"].each do |fixture|
      Game.create(
        home_team_name: fixture["homeTeamName"],
        away_team_name: fixture["awayTeamName"],
        date: fixture["date"],
        home_team_goals: fixture["result"]["goalsHomeTeam"],
        away_team_goals: fixture["result"]["goalsAwayTeam"],
        league: "Premier League"
      )
    end
    ligue1_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/396/fixtures/",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body
    ligue1_matches["fixtures"].each do |fixture|
      Game.create(
        home_team_name: fixture["homeTeamName"],
        away_team_name: fixture["awayTeamName"],
        date: fixture["date"],
        home_team_goals: fixture["result"]["goalsHomeTeam"],
        away_team_goals: fixture["result"]["goalsAwayTeam"],
        league: "Ligue 1"
      )
    end

    buli_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/394/fixtures/",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body
    buli_matches["fixtures"].each do |fixture|
      Game.create(
        home_team_name: fixture["homeTeamName"],
        away_team_name: fixture["awayTeamName"],
        date: fixture["date"],
        home_team_goals: fixture["result"]["goalsHomeTeam"],
        away_team_goals: fixture["result"]["goalsAwayTeam"],
        league: "Bundesliga"
      )
    end

    serieA_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/401/fixtures/",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body
    serieA_matches["fixtures"].each do |fixture|
      Game.create(
        home_team_name: fixture["homeTeamName"],
        away_team_name: fixture["awayTeamName"],
        date: fixture["date"],
        home_team_goals: fixture["result"]["goalsHomeTeam"],
        away_team_goals: fixture["result"]["goalsAwayTeam"],
        league: "Serie A"
      )
    end

    eredivisie_matches = Unirest.get(
      "http://api.football-data.org/v1/soccerseasons/404/fixtures/",
      headers: { "X-Auth-Token" => ENV["FOOTIE_API_KEY"].to_s }
    ).body
    eredivisie_matches["fixtures"].each do |fixture|
      Game.create(
        home_team_name: fixture["homeTeamName"],
        away_team_name: fixture["awayTeamName"],
        date: fixture["date"],
        home_team_goals: fixture["result"]["goalsHomeTeam"],
        away_team_goals: fixture["result"]["goalsAwayTeam"],
        league: "Eredivisie"
      )
    end

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