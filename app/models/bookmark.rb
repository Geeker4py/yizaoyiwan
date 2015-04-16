class Bookmark < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :discussion_id
end
