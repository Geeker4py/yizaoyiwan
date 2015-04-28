json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :id, :user_id_id, :discussion_id_id
  json.url bookmark_url(bookmark, format: :json)
end
