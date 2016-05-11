json.array! @premier_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.awayTeamName match.away_team_name
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
end

json.array! @ligue1_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.awayTeamName match.away_team_name
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
end

json.array! @serieA_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.awayTeamName match.away_team_name
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
end

json.array! @eredivisie_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.awayTeamName match.away_team_name
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
end

json.array! @buli_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.awayTeamName match.away_team_name
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
end

json.array! @champLeague_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.awayTeamName match.away_team_name
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
end