json.array!(@user_photos) do |user_photo|
  json.extract! user_photo, :id, :filename, :content_type, :file_contents
  json.url user_photo_url(user_photo, format: :json)
end
