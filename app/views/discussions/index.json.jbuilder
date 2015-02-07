json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :title, :content, :user_id, :category_id, :format
  json.url discussion_url(discussion, format: :json)
end
