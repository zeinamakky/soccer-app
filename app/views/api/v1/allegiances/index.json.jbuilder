json.array! @allegiances.each do |allegiance|
  json.id allegiance.id
  json.pub_id allegiance.pub_id
  json.team_id allegiance.team_id
  
end