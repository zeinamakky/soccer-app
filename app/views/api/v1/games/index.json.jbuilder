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