json.array! @premier_matches["fixtures"].each do |match|
  json.homeTeamName match["homeTeamName"]
  json.awayTeamName match["awayTeamName"]
  json.date match["date"]
  json.result match["result"]
  json.league "Premier League"
end

json.array! @ligue1_matches["fixtures"].each do |match|
  json.homeTeamName match["homeTeamName"]
  json.awayTeamName match["awayTeamName"]
  json.date match["date"]
  json.result match["result"]
  json.league "Ligue 1"
end

json.array! @serieA_matches["fixtures"].each do |match|
  json.homeTeamName match["homeTeamName"]
  json.awayTeamName match["awayTeamName"]
  json.date match["date"]
  json.result match["result"]
  json.league "Serie A"
end

json.array! @eredivisie_matches["fixtures"].each do |match|
  json.homeTeamName match["homeTeamName"]
  json.awayTeamName match["awayTeamName"]
  json.date match["date"]
  json.result match["result"]
  json.league "Eredivisie"
end

json.array! @buli_matches["fixtures"].each do |match|
  json.homeTeamName match["homeTeamName"]
  json.awayTeamName match["awayTeamName"]
  json.date match["date"]
  json.result match["result"]
  json.league "Bundesliga"
end

json.array! @champLeague_matches["fixtures"].each do |match|
  json.homeTeamName match["homeTeamName"]
  json.awayTeamName match["awayTeamName"]
  json.date match["date"]
  json.result match["result"]
  json.league "Champions League"
end