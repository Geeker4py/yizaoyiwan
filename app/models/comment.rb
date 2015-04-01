class Comment < ActiveRecord::Base
  extend Enumerize

  enumerize :parser, in: [:markdown, :html], default: :html
  belongs_to :user
  belongs_to :discussion
  belongs_to :deleted_by_user, class_name: User, foreign_key: :deleted_by

  after_create :update_disscussion_last_comment

  def deleted?
    self.deleted_at.present?
  end

  private

  def update_disscussion_last_comment
    self.discussion.update_attributes(last_comment_user: self.user,
                                      last_comment_at: self.updated_at)
  end
end
