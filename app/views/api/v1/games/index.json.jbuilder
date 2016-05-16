json.array! @premier_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.homeTeamIcon match.home_team_icon
  json.awayTeamName match.away_team_name
  json.awayTeamIcon match.away_team_icon
  json.cal_time match.starting_time
  json.cal_end_time match.ending_time
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
  json.pubs match.pubs.each do |pub|
    json.id pub.id
    json.name pub.name
    json.address1 pub.address1
    json.address2 pub.address2
    json.city pub.city
    json.state pub.state
    json.zip pub.zip
  end
end

json.array! @ligue1_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.homeTeamIcon match.home_team_icon
  json.awayTeamName match.away_team_name
  json.awayTeamIcon match.away_team_icon
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
  json.pubs match.pubs.each do |pub|
    json.id pub.id
    json.name pub.name
    json.address1 pub.address1
    json.address2 pub.address2
    json.city pub.city
    json.state pub.state
    json.zip pub.zip
  end
end

json.array! @serieA_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.homeTeamIcon match.home_team_icon
  json.awayTeamName match.away_team_name
  json.awayTeamIcon match.away_team_icon
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
  json.pubs match.pubs.each do |pub|
    json.id pub.id
    json.name pub.name
    json.address1 pub.address1
    json.address2 pub.address2
    json.city pub.city
    json.state pub.state
    json.zip pub.zip
  end
end

json.array! @eredivisie_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.homeTeamIcon match.home_team_icon
  json.awayTeamName match.away_team_name
  json.awayTeamIcon match.away_team_icon
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
  json.pubs match.pubs.each do |pub|
    json.id pub.id
    json.name pub.name
    json.address1 pub.address1
    json.address2 pub.address2
    json.city pub.city
    json.state pub.state
    json.zip pub.zip
  end
end

json.array! @buli_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.homeTeamIcon match.home_team_icon
  json.awayTeamName match.away_team_name
  json.awayTeamIcon match.away_team_icon
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
  json.pubs match.pubs.each do |pub|
    json.id pub.id
    json.name pub.name
    json.address1 pub.address1
    json.address2 pub.address2
    json.city pub.city
    json.state pub.state
    json.zip pub.zip
  end
end

json.array! @champLeague_matches.each do |match|
  json.id match.id
  json.homeTeamName match.home_team_name
  json.homeTeamIcon match.home_team_icon
  json.awayTeamName match.away_team_name
  json.awayTeamIcon match.away_team_icon
  json.date match.pretty_date
  json.home_team_goals match.home_team_goals 
  json.away_team_goals match.away_team_goals
  json.league match.league
  json.pubs match.pubs.each do |pub|
    json.id pub.id
    json.name pub.name
    json.address1 pub.address1
    json.address2 pub.address2
    json.city pub.city
    json.state pub.state
    json.zip pub.zip
  end
end