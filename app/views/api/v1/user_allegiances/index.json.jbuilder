json.array! @user_allegiances.each do |user_allegiance|
  json.id user_allegiance.id
  json.user_id user_allegiance.user_id
  json.team_id user_allegiance.team_id
  
end