json.extract! post, :id, :Title, :content, :date, :created_at, :updated_at
json.url post_url(post, format: :json)
