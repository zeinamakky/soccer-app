json.array! @teams.each do |team|
  json.id team.id
  json.name team.name
  json.icon team.icon 
  json.league team.league
  
end