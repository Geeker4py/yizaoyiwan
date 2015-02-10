json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :discussion_id, :user_id, :parser
  json.url comment_url(comment, format: :json)
end
