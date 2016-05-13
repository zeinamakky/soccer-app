json.array! @user_games.each do |user_game|
  json.id user_game.id
  json.pub_id user_game.pub_id
  json.game_id user_game.game_id
  json.user_id user_game.user_id
end