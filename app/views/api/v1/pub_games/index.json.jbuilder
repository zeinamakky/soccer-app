json.array! @pub_games.each do |pub_game|
  json.id pub_game.id
  json.pub_id pub_game.pub_id
  json.game_id pub_game.game_id
  json.date pub_game.date
  
end