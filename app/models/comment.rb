class Comment < ActiveRecord::Base
  extend Enumerize

  enumerize :parser, in: [:markdown, :html], default: :html
  belongs_to :user
  belongs_to :discussion
  belongs_to :deleted_by_user, class_name: User, foreign_key: :deleted_by

  def deleted?
    self.deleted_at.present?
  end
end
