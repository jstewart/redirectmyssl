json.extract! redirect, :id, :from, :to, :active, :created_at, :updated_at
json.url redirect_url(redirect, format: :json)
