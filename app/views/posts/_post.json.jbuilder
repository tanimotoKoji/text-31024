json.extract! post, :id, :title, :pay_id, :price, :user_id, :category_id, :created_at, :updated_at
json.url post_url(post, format: :json)
