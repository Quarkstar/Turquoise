json.extract! product, :id, :store_id, :name, :type, :info, :picture, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
