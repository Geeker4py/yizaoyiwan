class Comment < ActiveRecord::Base
  extend Enumerize

  enumerize :parser, in: [:markdown, :html], default: :html
  belongs_to :user
  belongs_to :discussion
end
