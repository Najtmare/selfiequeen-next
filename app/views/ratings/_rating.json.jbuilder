json.extract! rating, :id, :photo_id, :user_id, :stars, :created_at, :updated_at
json.url rating_url(rating, format: :json)